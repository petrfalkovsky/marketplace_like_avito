import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final defaultThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: mainColor,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: mainColor),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: false,
    elevation: 0,
    backgroundColor: Colors.white,
  ),
  fontFamily: 'SFProDisplay',

  // стили кнопок

  // стиль ElevatedButton()
  // todo как применять, пример:
/*  
  ElevatedButton(
      onPressed: () {},
      child: Text(
        'Сохранить',
      ),
      style: ElevatedButton.styleFrom(
        primary: buttonBackgroundSettingsScreenNonActive, // если нужно поменять на неактивный цвет
        minimumSize: Size(
          ScreenUtil().setWidth(250),
          ScreenUtil().setHeight(56),
        ), // если нужно настроить размер
      ),
    );
 */

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: buttonBackgroundSettingsScreenActive, // background color
      onPrimary: whiteColor, // text btn color
      onSurface: buttonBackgroundSettingsScreenActive,
      shadowColor: whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TextStyle(
        fontSize: ScreenUtil().setHeight(16),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontFamily: 'SFProDisplay',
      ),
    ),
  ),

  // стиль ElevatedButton()

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: buttonBackgroundSettingsScreenActive, // background color
      onSurface: buttonBackgroundSettingsScreenActive,
      shadowColor: whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TextStyle(
        fontSize: ScreenUtil().setHeight(16),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontFamily: 'SFProDisplay',
      ),
    ),
  ),
);

class AntaresMarketTextTheme {
  /// h1 жирный заголовок зеленый (бывший headline1) ✔️
  static final TextStyle h1mainColor32w900 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(32),
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  /// h2 второй жирный заголовок зеленый (бывший headline2) ✔️
  static final TextStyle h2mainColor24w900 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(24),
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  /// h3 жирный подзаголовок черный (бывший headline3) ✔️
  static final TextStyle h3grey2Color18w700 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(18),
    fontWeight: FontWeight.w700,
    color: grey2Color,
  );

  /// h3_1 жирный подзаголовок черный (не было раньше) ✔️
  static final TextStyle h3_1mainColor18w700 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(18),
    fontWeight: FontWeight.w700,
    color: mainColor,
  );

  /// h4 жирный второй подзаголовок зеленый (не было раньше) ✔️
  static final TextStyle h4mainColor16w700 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w700,
    color: mainColor,
  );

  /// h5 жирный второй подзаголовок черный (бывший headline5) ✔️
  static final TextStyle h5grey2Color16w700 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w700,
    color: grey2Color,
  );

  /// h6 нежирный подзаголовок черный (бывший subtitle1) ✔️
  static final TextStyle h6grey2Color16w500 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w500,
    color: grey2Color,
  );

  /// h6 нежирный подзаголовок черный (бывший subtitle1) ✔️
  static final TextStyle h6black2Color16w500 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w500,
    color: blackColor,
  );

  /// h7 нежирный подзаголовок зеленый (бывший headline4) ✔️
  static final TextStyle h7mainColor16w500 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w500,
    color: mainColor,
  );

  /// h8 нежирный подзаголовок голубовато-зеленый (не было раньше) ✔️
  static final TextStyle h8mainFlatColor16w400 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w400,
    color: mainFlatColor,
  );

  /// p1 жирный текст абзаца черный (бывший subtitle2) ✔️
  static final TextStyle p1grey2Color16w400 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w400,
    color: grey2Color,
  );

  /// p1_2 нежирный текст абзаца светло-серый (не было раньше) ✔️
  static final TextStyle p1_2grey3Color16w400 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(16),
    fontWeight: FontWeight.w400,
    color: grey3Color,
  );

  /// p2 второй жирный текст абзаца черный (бывший headline6) ✔️
  static final TextStyle p2grey2Color14w700 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(14),
    fontWeight: FontWeight.w700,
    color: grey2Color,
  );

  /// p3 третий нежирный текст абзаца черный (бывший bodyText1)
  static final TextStyle p3grey2Color14w400 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(14),
    fontWeight: FontWeight.w400,
    color: grey2Color,
  );

  /// p4 третий нежирный текст абзаца черный (бывший bodyText2) ✔️
  static final TextStyle p4grey2Color12w400 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(12),
    fontWeight: FontWeight.w400,
    color: grey2Color,
  );

  /// p5 четвертый текст абзаца светло-серый (не было раньше) ✔️
  static final TextStyle p5grey3Color12w400 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: ScreenUtil().setHeight(12),
    fontWeight: FontWeight.w400,
    color: grey3Color,
  );
}

class AntaresMarketButtonTheme {
  static final ButtonStyle midleInActiveButtonTwoInRow =
      ElevatedButton.styleFrom(
    minimumSize: Size(ScreenUtil().setWidth(168), ScreenUtil().setHeight(46)),
    primary: nonActiveColor, // background color
    onPrimary: whiteColor, // text btn color
    shadowColor: whiteColor,
    padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setHeight(10)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: TextStyle(
      fontSize: ScreenUtil().setHeight(13),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontFamily: 'SFProDisplay',
    ),
  );
  static final ButtonStyle midleActiveButtonTwoInRow = ElevatedButton.styleFrom(
    minimumSize: Size(ScreenUtil().setWidth(168), ScreenUtil().setHeight(46)),
    primary: mainLightColor, // background color
    onPrimary: whiteColor, // text btn color
    shadowColor: whiteColor,
    padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setHeight(10)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: TextStyle(
      fontSize: ScreenUtil().setHeight(13),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontFamily: 'SFProDisplay',
    ),
  );

  static final ButtonStyle midleActiveButtonOneInRow = ElevatedButton.styleFrom(
    minimumSize: Size(ScreenUtil().setWidth(144), ScreenUtil().setHeight(50)),
    primary: mainLightColor, // background color
    onPrimary: whiteColor, // text btn color
    shadowColor: whiteColor,
    padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setHeight(10)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: TextStyle(
      fontSize: ScreenUtil().setHeight(16),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontFamily: 'SFProDisplay',
    ),
  );
}
