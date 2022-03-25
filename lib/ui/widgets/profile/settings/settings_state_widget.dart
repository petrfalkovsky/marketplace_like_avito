import 'package:antares_market/core/const.dart';
import 'package:antares_market/ui/index.dart';
import 'package:antares_market/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class SettingsStateWidget extends StatefulWidget {
  final Function() onBackPressed;
  const SettingsStateWidget({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  _SettingsStateWidgetState createState() => _SettingsStateWidgetState();
}

class _SettingsStateWidgetState extends State<SettingsStateWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SimpleSliverAppBar(
            titleText: 'Настройки',
            onBackPressed: widget.onBackPressed,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  SettingsFirstUIBlockWidget(),
                  SettingsSecondUIBlockScreen(),
                  SettingsThirdUIBlockScreen(),
                  SettingsFoursUIBlockScreen(),
                  SettingsFifthUIBlockScreen(),
                ],
              ),
            ]),
          ),
        ],
      );
    });
  }
}

/*class MySettingsScreen extends StatelessWidget {
  const MySettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBarWidgetForMySettingScreen(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(8),
                    horizontal: ScreenUtil().setWidth(16),
                  ),
                  child: Column(
                    children: [
                      SettingsFirstUIBlockWidget(),
                      SettingsSecondUIBlockScreen(),
                      SettingsThirdUIBlockScreen(),
                      SettingsFoursUIBlockScreen(),
                      SettingsFifthUIBlockScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

class SettingsSecondUIBlockScreen extends StatelessWidget {
  const SettingsSecondUIBlockScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Имя',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: greyColor,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setHeight(14),
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 5),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Фамилия',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: greyColor,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setHeight(14),
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 5),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ],
    );
  }
}

class SettingsFirstUIBlockWidget extends StatelessWidget {
  const SettingsFirstUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: ScreenUtil().radius(50),
          backgroundColor: Colors.transparent,
          backgroundImage: const AssetImage('assets/images/avatar.png'),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Выберите файл',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: blue3Color,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setHeight(14),
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ElevatedButtonSaveNonActive(),
        // ElevatedButtonSaveActive(),
      ],
    );
  }
}

class ElevatedButtonSaveNonActive extends StatelessWidget {
  const ElevatedButtonSaveNonActive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Сохранить',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setHeight(17),
          fontFamily: 'SF Pro Display',
        ),
      ),
      style: ElevatedButton.styleFrom(
        // primary: buttonBackgroundSettingsScreenNonActive,
        // onPrimary: buttonBackgroundSettingsScreenActive,
        // onSurface: buttonBackgroundSettingsScreenActive,
        shadowColor: whiteColor,
        minimumSize: Size(250, 56),
        //  double elevation,
        //  TextStyle textStyle,
        //  EdgeInsetsGeometry padding,
        //  Size minimumSize или fixedSize,
        //  BorderSide side,
        //  OutlinedBorder shape,
        //  MouseCursor enabledMouseCursor,
        //  MouseCursor disabledMouseCursor,
        //  VisualDensity visualDensity,
        //  MaterialTapTargetSize tapTargetSize,
        //  Duration animationDuration,
        //  bool enableFeedback
      ),
    );
  }
}

class ElevatedButtonSaveActive extends StatelessWidget {
  const ElevatedButtonSaveActive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Сохранить',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setHeight(17),
          fontFamily: 'SF Pro Display',
        ),
      ),
      style: ElevatedButton.styleFrom(
        // primary: buttonBackgroundSettingsScreenActive,
        // onPrimary: buttonBackgroundSettingsScreenNonActive,
        // onSurface: buttonBackgroundSettingsScreenActive,
        shadowColor: whiteColor,
        minimumSize: Size(250, 56),
        //  double elevation,
        //  TextStyle textStyle,
        //  EdgeInsetsGeometry padding,
        //  Size minimumSize или fixedSize,
        //  BorderSide side,
        //  OutlinedBorder shape,
        //  MouseCursor enabledMouseCursor,
        //  MouseCursor disabledMouseCursor,
        //  VisualDensity visualDensity,
        //  MaterialTapTargetSize tapTargetSize,
        //  Duration animationDuration,
        //  bool enableFeedback
      ),
    );
  }
}

class AppBarWidgetForMySettingScreen extends StatelessWidget {
  const AppBarWidgetForMySettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
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
        child: AppBar(
          centerTitle: false,
          title: Text(
            'Настройки',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          elevation: 0.5,
        ),
      ),
    );
  }
}

class SettingsThirdUIBlockScreen extends StatelessWidget {
  const SettingsThirdUIBlockScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Язык'),
        Spacer(),
        Icon(Icons.done_rounded),
        //

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
        //
      ],
    );
  }
}

class SettingsFoursUIBlockScreen extends StatelessWidget {
  const SettingsFoursUIBlockScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Имя',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: greyColor,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setHeight(14),
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 5),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'petrfalkovsky@yandex.ru',
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Фамилия',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: greyColor,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setHeight(14),
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 5),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '********',
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Antares ID',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: greyColor,
              fontWeight: FontWeight.normal,
              fontSize: ScreenUtil().setHeight(14),
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 5),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Antares ID',
          ),
        ),
      ],
    );
  }
}

class SettingsFifthUIBlockScreen extends StatelessWidget {
  const SettingsFifthUIBlockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ElevatedButtonVerifyActive(),
        SizedBox(height: 30),
        Text('Правила рассылки'),
        CheckboxMessageStatefulWidget(),
        CheckboxReviewsStatefulWidget(),
        CheckboxAdvertsStatefulWidget(),
        CheckboxNewsStatefulWidget(),
        SizedBox(height: 30),
        ElevatedButtonSaveActive(),
        SizedBox(height: 30),
      ],
    );
  }
}

class ElevatedButtonVerifyActive extends StatelessWidget {
  const ElevatedButtonVerifyActive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Верифицировать',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setHeight(17),
          fontFamily: 'SF Pro Display',
        ),
      ),
      style: ElevatedButton.styleFrom(
        // primary: buttonBackgroundSettingsScreenActive,
        // onPrimary: buttonBackgroundSettingsScreenNonActive,
        // onSurface: buttonBackgroundSettingsScreenActive,
        shadowColor: whiteColor,
        minimumSize: Size(250, 56),
        //  double elevation,
        //  TextStyle textStyle,
        //  EdgeInsetsGeometry padding,
        //  Size minimumSize или fixedSize,
        //  BorderSide side,
        //  OutlinedBorder shape,
        //  MouseCursor enabledMouseCursor,
        //  MouseCursor disabledMouseCursor,
        //  VisualDensity visualDensity,
        //  MaterialTapTargetSize tapTargetSize,
        //  Duration animationDuration,
        //  bool enableFeedback
      ),
    );
  }
}

class CheckboxMessageStatefulWidget extends StatefulWidget {
  const CheckboxMessageStatefulWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxMessageStatefulWidget> createState() =>
      _CheckboxMessageStatefulWidgetState();
}

class _CheckboxMessageStatefulWidgetState
    extends State<CheckboxMessageStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: SizedBox(
        height: 32.0,
        child: CheckboxListTile(
          // activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Сообщения'),
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 2.0 : 1.0;
            });
          },
        ),
      ),
      data: ThemeData(
        unselectedWidgetColor: nonActiveColor,
      ),
    );
  }
}

class CheckboxReviewsStatefulWidget extends StatefulWidget {
  const CheckboxReviewsStatefulWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxReviewsStatefulWidget> createState() =>
      _CheckboxReviewsStatefulWidgetState();
}

class _CheckboxReviewsStatefulWidgetState
    extends State<CheckboxReviewsStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: SizedBox(
        height: 32.0,
        child: CheckboxListTile(
          // activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Отзывы'),
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 2.0 : 1.0;
            });
          },
        ),
      ),
      data: ThemeData(
        unselectedWidgetColor: nonActiveColor,
      ),
    );
  }
}

class CheckboxAdvertsStatefulWidget extends StatefulWidget {
  const CheckboxAdvertsStatefulWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxAdvertsStatefulWidget> createState() =>
      _CheckboxAdvertsStatefulWidgetState();
}

class _CheckboxAdvertsStatefulWidgetState
    extends State<CheckboxAdvertsStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: SizedBox(
        height: 32.0,
        child: CheckboxListTile(
          // activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Объявления'),
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 2.0 : 1.0;
            });
          },
        ),
      ),
      data: ThemeData(
        unselectedWidgetColor: nonActiveColor,
      ),
    );
  }
}

class CheckboxNewsStatefulWidget extends StatefulWidget {
  const CheckboxNewsStatefulWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxNewsStatefulWidget> createState() =>
      _CheckboxNewsStatefulWidgetState();
}

class _CheckboxNewsStatefulWidgetState
    extends State<CheckboxNewsStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: SizedBox(
        height: 32.0,
        child: CheckboxListTile(
          // activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Объявления'),
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 2.0 : 1.0;
            });
          },
        ),
      ),
      data: ThemeData(
        unselectedWidgetColor: nonActiveColor,
      ),
    );
  }
}
