import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutex/flutex.dart';
import 'package:get/route_manager.dart';

class SearchBar extends StatefulWidget {
  final List<ItemCategoryModel> categories;
  final bool showFilterOnTap;
  final VoidCallback? onBackPressed;
  final String search;
  final void Function(String)? onSearch;
  final VoidCallback? onCancel;

  SearchBar({
    required this.categories,
    required this.showFilterOnTap,
    this.onBackPressed,
    this.search = '',
    this.onSearch,
    this.onCancel,
    Key? key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchFocus = FocusNode();
  bool _focused = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    _searchFocus.addListener(() {
      setState(() {
        if (_focused == _searchFocus.hasPrimaryFocus) return;
        _focused = _searchFocus.hasPrimaryFocus;
      });
    });
    _controller.text = widget.search;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchBar oldWidget) {
    _controller.text = widget.search;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Return name of current locale
  /// String locale variable allows to return emoji by locale name
  String _currentLocale(
    BuildContext context, {
    String? locale,
  }) {
    Locale loc;
    if (locale == null) {
      loc = context.locale;
    } else {
      loc = Locale(locale);
    }
    if (loc == Locale('ru')) {
      return '🇷🇺';
    } else if (loc == Locale('es')) {
      return '🇪🇸';
    } else if (loc == Locale('fr')) {
      return '🇫🇷';
    } else if (loc == Locale('id')) {
      return '🇮🇩';
    } else if (loc == Locale('zh')) {
      return '🇨🇳';
    } else {
      return '🇺🇸';
    }
  }

  String _currentStringLocale({required String locale}) {
    switch (locale) {
      case '🇷🇺':
        return 'ru';
      case '🇫🇷':
        return 'fr';
      case '🇪🇸':
        return 'es';
      case '🇮🇩':
        return 'id';
      case '🇨🇳':
        return 'zh';
      default:
        return 'en';
    }
  }

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    final topSafeArea = MediaQuery.of(context).padding.top;
    final height = kToolbarHeight + topSafeArea;
    return Container(
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
        child: Column(
          children: [
            SizedBox(height: topSafeArea),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.onBackPressed != null
                    ? BackButton(
                        onPressed: widget.onBackPressed,
                        color: mainColor,
                      )
                    : SizedBox(
                        width: ScreenUtil().setWidth(15),
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
                          onSubmitted: widget.onSearch,
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
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                _endSearchWidget(context),
                SizedBox(
                  width: ScreenUtil().setWidth(15),
                ),
              ],
            ).expanded(),
          ],
        ),
      ),
    );
  }

  Widget _endSearchWidget(BuildContext context) {
    return IfBuild(
      check: _focused,
      ifTrue: (context) => TextButton(
        child: Text(
          'Отменить'.tr(),
          style: TextStyle(
            fontSize: 16,
            color: blue3Color,
          ),
        ),
        onPressed: () {
          _searchFocus.unfocus();
          widget.onCancel?.call();
        },
      ),
      ifFalse: (context) {
        return Row(
          children: [
            if (widget.categories.isNotEmpty)
              FaIcon(
                FontAwesomeIcons.slidersH,
                size: 20,
                color: Colors.greenAccent,
              ).onTap(() {
                if (widget.showFilterOnTap) {
                  Get.toNamed(
                    AppRoutes.SEARCH_FILTER,
                  );
                } else {
                  Get.toNamed(
                    AppRoutes.SEARCH_CATEGORY_SELECT,
                    arguments: {
                      'categories': widget.categories,
                    },
                  );
                }
              }),
            if (widget.onBackPressed == null) ...[
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              DropdownButton<String>(
                value: _currentLocale(context),
                iconSize: 0,
                elevation: 0,
                underline: Container(
                  height: 0,
                ),
                onChanged: (String? locale) async {
                  await context.setLocale(
                    Locale(
                      _currentStringLocale(
                        locale: locale ?? '',
                      ),
                    ),
                  );
                  WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.MAIN, (route) => false);
                },
                items: APP_LOCALES.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: _currentLocale(context, locale: value),
                    child: Text(
                      _currentLocale(context, locale: value),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        );
      },
    );
  }
}
