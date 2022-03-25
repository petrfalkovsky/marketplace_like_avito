import 'dart:async';
import 'dart:ui';

import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/injection_container.dart';
import 'package:antares_market/ui/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutex/flutex.dart';

class ProductListState extends StatefulWidget {
  final SearchBloc searchBloc;
  const ProductListState({required this.searchBloc});
  @override
  _ProductListStateState createState() => _ProductListStateState();
}

class _ProductListStateState extends State<ProductListState>
    with StateUtilsMixin, CancelMixin, AutomaticKeepAliveClientMixin {
  late SearchBloc _searchBloc;
  late MessageBus _messageBus;
  SearchState? _latestState;

  double _lastScrollPos = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _messageBus = getIt();
    _searchBloc = widget.searchBloc;
    _searchBloc.add(OpenCategoryEvent(
      category: null,
      search: null,
      cancelToken: cancelTokenSource.token,
    ));

    _messageBus.subscribe<SearchFilterUpdatedEvent>(this, (event) {
      if (_latestState == null) return;
      _searchBloc.add(OpenCategoryEvent(
        category: _latestState!.currentCategory,
        search: _latestState!.search,
        withFullScreenLoading: true,
        cancelToken: cancel(),
      ));
    });
    super.initState();
  }

  @override
  void dispose() {
    cancel();
    _messageBus.unsubscribe<SearchFilterUpdatedEvent>(this);

    super.dispose();
  }

  bool _onScrolled(
    SearchState state,
    ScrollUpdateNotification notification,
  ) {
    if (notification.metrics.axisDirection != AxisDirection.down) return true;

    // filter too much checkings
    if ((notification.metrics.pixels - _lastScrollPos).abs() < 100) return true;
    _lastScrollPos = notification.metrics.pixels;

    if (!state.hasReachedMax &&
        !state.isPaginating &&
        notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 1000) {
      final cancelToken = cancel();
      _searchBloc.add(
        FetchEvent(
          cancelToken: cancelToken,
        ),
      );
    }

    return true;
  }

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _searchBloc,
      builder: (context, state) {
        _latestState = state;
        _lastScrollPos = 0;
        return Column(
          children: [
            SearchBar(
              categories: state.categories,
              showFilterOnTap: !state.isMainPage,
              onBackPressed: !state.isMainPage
                  ? () {
                      _searchBloc.add(
                        OpenCategoryEvent(
                          category: null,
                          cancelToken: cancelTokenSource.token,
                          search: '',
                        ),
                      );
                    }
                  : null,
              search: state.search,
              onSearch: (search) {
                _searchBloc.add(OpenCategoryEvent(
                  category: state.currentCategory,
                  search: search,
                  cancelToken: cancel(),
                ));
              },
              onCancel: () {
                _searchBloc.add(OpenCategoryEvent(
                  category: state.currentCategory,
                  search: '',
                  cancelToken: cancel(),
                ));
              },
            ),
            NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) => _onScrolled(
                state,
                notification,
              ),
              child: RefreshIndicator(
                onRefresh: () {
                  final completer = Completer();
                  _searchBloc.add(OpenCategoryEvent(
                    category: state.currentCategory,
                    search: state.search,
                    withFullScreenLoading: false,
                    completer: completer,
                    cancelToken: cancel(),
                  ));

                  return completer.future;
                },
                child: CustomScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  slivers: [
                    if (state.status == SearchStatus.error)
                      SliverFillRemaining(
                        fillOverscroll: true,
                        hasScrollBody: false,
                        child: Text(state.error).tr().center(),
                      ),
                    if (state.status == SearchStatus.loading)
                      SliverFillRemaining(
                        fillOverscroll: true,
                        hasScrollBody: false,
                        child: AntProgressIndicator().center(),
                      ),
                    if (state.status == SearchStatus.normal) ...[
                      if (state.isMainPage && state.search.isEmpty)
                        _categoryList(
                          mainCategories: state.mainCategories,
                        ),
                      SliverItemsList(
                        children: [
                          SizedBox(height: ScreenUtil().setHeight(20)),
                          _title(
                              text: state.currentCategory?.name ??
                                  (state.search.isEmpty ? '' : 'Поиск'))
                        ],
                      ),
                      ..._newAdsList(state),
                    ],
                  ],
                ),
              ),
            ).expanded(),
          ],
        );
      },
    );
  }

  Widget _categoryList({
    required List<ItemCategoryModel> mainCategories,
  }) {
    if (mainCategories.length > 0) {
      return SliverPadding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10),
          left: ScreenUtil().setWidth(10),
          right: ScreenUtil().setWidth(10),
        ),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final category = mainCategories[index];
              return Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setWidth(5),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _searchBloc.add(OpenCategoryEvent(
                      category: category,
                      cancelToken: cancel(),
                      search: '',
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: categoryIcon(name: category.name).color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(9),
                        ),
                      )),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          categoryIcon(name: category.name).iconData,
                          size: ScreenUtil().setWidth(50),
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Text(
                          category.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ).tr(),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: mainCategories.length,
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter();
    }
  }

  List<Widget> _newAdsList(SearchState state) {
    if (state.products.isEmpty)
      return [
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: false,
          child: Text('Ничего не найдено').tr().center(),
        ),
      ];
    return [
      SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
        ),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final productItem = state.products[index];
              return ProductWidget(
                productItem: productItem,
                categories: state.categories,
              );
            },
            childCount: state.products.length,
          ),
        ),
      ),
      SliverItemsList(
        children: [
          SizedBox(
            height: 60,
            child:
                !state.hasReachedMax ? AntProgressIndicator().center() : null,
          ),
          BottomSafeArea(height: 90)
        ],
      ),
    ];
  }

  Widget _title({required String text}) {
    String _titleText = '';
    if (text != '') {
      _titleText = text;
    } else {
      _titleText = 'Новые объявления';
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(15),
        horizontal: ScreenUtil().setWidth(15),
      ),
      child: Text(
        _titleText,
        style: TextStyle(
          color: mainColor,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ).tr(),
    );
  }
}
