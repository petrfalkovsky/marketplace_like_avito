import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutex/flutex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class ListSelectorPage extends StatefulWidget {
  ListSelectorPage({Key? key}) : super(key: key);

  @override
  _ListSelectorPageState createState() => _ListSelectorPageState();
}

class _ListSelectorPageState extends State<ListSelectorPage>
    with StateUtilsMixin {
  final _searchFocus = FocusNode();
  final _controller = TextEditingController();
  bool _focused = false;

  late String Function(dynamic item) _getName;
  late void Function(dynamic item) _onSelected;
  List _allItems = [];
  List _shownItems = [];

  @override
  void didInitDependencies() {
    super.didInitDependencies();
    _searchFocus.addListener(() {
      setState(() {
        if (_focused == _searchFocus.hasPrimaryFocus) return;
        _focused = _searchFocus.hasPrimaryFocus;
      });
    });
    _allItems = args!.checkMapAndGet('list') as dynamic;
    _getName = args!.checkMapAndGet('getName') as dynamic;
    _onSelected = args!.checkMapAndGet('onSelected') as dynamic;
    _search();
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    final str = _controller.text.toLowerCase();
    setState(() {
      if (str.isEmpty)
        _shownItems = _allItems;
      else
        _shownItems = _allItems
            .where((item) => _getName(item).toLowerCase().contains(str))
            .toList();
    });
  }

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: _appBar(),
      body: _content(),
    );
  }

  PreferredSize _appBar() {
    final topSafeArea = MediaQuery.of(context).padding.top;
    final height = kToolbarHeight + topSafeArea;
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        padding: EdgeInsets.only(top: topSafeArea),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: Offset(0, 2),
              color: Color.fromARGB(25, 0, 146, 169),
            ),
          ],
          color: Colors.white,
        ),
        child: Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BackButton(
                color: mainColor,
              ),
              Expanded(
                child: Container(
                  height: ScreenUtil().setHeight(45),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenUtil().setHeight(10),
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      FaIcon(
                        FontAwesomeIcons.search,
                        size: 20,
                        color: nonActiveColor,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      TextField(
                        textCapitalization: TextCapitalization.sentences,
                        focusNode: _searchFocus,
                        controller: _controller,
                        maxLines: 1,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          hintStyle: TextStyle(color: nonActiveColor),
                          hintText: 'Поиск'.tr(),
                          border: InputBorder.none,
                        ),
                        onChanged: (_) => _search(),
                      ).expanded(),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                    ],
                  ),
                ).onTap(() {
                  _searchFocus.requestFocus();
                }),
              ),
              if (_focused) ...[
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                TextButton(
                  child: Text(
                    'Отменить'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      color: blue3Color,
                    ),
                  ),
                  onPressed: () {
                    _searchFocus.unfocus();
                    _controller.text = '';
                    _search();
                  },
                ),
              ],
              SizedBox(
                width: ScreenUtil().setWidth(15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final item = _shownItems[i];
              return ListTile(
                title: Text(_getName(item)),
                onTap: () {
                  Get.back();
                  _onSelected(item);
                },
              );
            },
            childCount: _shownItems.length,
          ),
        ),
        SliverBottomSafeArea(),
      ],
    );
  }
}
