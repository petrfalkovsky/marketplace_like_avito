import '../../../bloc/index.dart';
import '../../../core/index.dart';
import '../../index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesStateWidget extends StatefulWidget {
  final FavoritesBloc favoritesBloc;
  FavoritesStateWidget({
    Key? key,
    required this.favoritesBloc,
  }) : super(key: key);

  @override
  _FavoritesStateWidgetState createState() => _FavoritesStateWidgetState();
}

class _FavoritesStateWidgetState extends State<FavoritesStateWidget>
    with StateUtilsMixin, CancelMixin, AutomaticKeepAliveClientMixin {
  late FavoritesBloc _favoritesBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void didInitDependencies() {
    super.didInitDependencies();
  }

  @override
  void initState() {
    _favoritesBloc = widget.favoritesBloc;
    _favoritesBloc.add(UploadFavoritesEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      bloc: _favoritesBloc,
      builder: (context, state) {
        if (state.statusSwitch == FavoritesSwitchStatus.subUser &&
            state.userSubId != null) {
          return UserProfileStateWidget(
            userId: state.userSubId!,
            onBackPressed: () {
              _favoritesBloc.add(UploadSubscriptionsEvent());
            },
          );
        }
        return CustomScrollView(
          slivers: [
            SimpleSliverAppBar(titleText: 'Избранное'),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(25),
                vertical: ScreenUtil().setHeight(15),
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SwitcherButtonForFavoritesScreenWidget(
                      text: 'Объявления',
                      selected: state.statusSwitch == FavoritesSwitchStatus.fav,
                      onPressed: () {
                        _favoritesBloc.add(UploadFavoritesEvent(
                          favoritesProducts: state.favoritesProducts,
                        ));
                      },
                    ),
                    Spacer(),
                    SwitcherButtonForFavoritesScreenWidget(
                      text: 'Пользователи',
                      selected: state.statusSwitch == FavoritesSwitchStatus.sub,
                      onPressed: () {
                        _favoritesBloc.add(UploadSubscriptionsEvent(
                          userSubscriptions: state.userSubscriptions,
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (state.status == FavoritesStatus.error)
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                  ),
                  child: Text(
                    state.error,
                    textAlign: TextAlign.center,
                  ).tr().center(),
                ),
              ),
            if (state.status == FavoritesStatus.isEmpty)
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                  ),
                  child: Text(
                    state.statusSwitch == FavoritesSwitchStatus.fav
                        ? 'Добавляйте объявления в избранное, '
                                'чтобы посмотреть их позже'
                            .tr()
                        : 'Подписывайтесь на людей, '
                                'чтобы посмотреть их позже'
                            .tr(),
                    textAlign: TextAlign.center,
                  ).center(),
                ),
              ),
            if (state.status == FavoritesStatus.loading)
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: false,
                child: AntProgressIndicator().center(),
              ),
            if (state.status == FavoritesStatus.normal) ...[
              if (state.statusSwitch == FavoritesSwitchStatus.fav)
                favoriteItems(state),
              if (state.statusSwitch == FavoritesSwitchStatus.sub)
                userSubscription(state),
            ],
          ],
        );
      },
    );
  }

  SliverPadding favoriteItems(FavoritesState state) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(10),
        horizontal: ScreenUtil().setWidth(16),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => FavoriteItemWidget(
            productItem: state.favoritesProducts[i],
            favoritesBloc: _favoritesBloc,
            categories: state.categories,
          ),
          childCount: state.favoritesProducts.length,
        ),
      ),
    );
  }

  SliverPadding userSubscription(FavoritesState state) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(10),
        horizontal: ScreenUtil().setWidth(16),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => UserSubscriptionWidget(
            userSubscription: state.userSubscriptions[i],
            onPressed: () {
              _favoritesBloc.add(
                OpenSubscribedUserProfileEvent(
                  userSubId: state.userSubscriptions[i].id,
                  cancelToken: CancelToken(),
                ),
              );
            },
          ),
          childCount: state.userSubscriptions.length,
        ),
      ),
    );
  }
}

class SwitcherButtonForFavoritesScreenWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool selected;

  const SwitcherButtonForFavoritesScreenWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgColor = selected ? Colors.white : Colors.transparent;
    final double elevation = selected ? 1 : 0;
    final FontWeight fontWeight =
        selected ? FontWeight.bold : FontWeight.normal;
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all(bgColor),
        // padding:
        //     MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff212121),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
