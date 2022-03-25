import 'package:antares_market/core/index.dart';
import 'package:antares_market/core/services/app_preferences.dart';
import 'package:antares_market/injection_container.dart';
import 'package:antares_market/ui/index.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutex/flutex.dart';

Future<void> initAppResources() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  await getItSetup(appDocDir: appDocDir);
  final dio = getIt<Dio>();
  dio.interceptors.add(getIt<CookieManager>());
  AppPreferences.prefs = getIt();

  SessionController.checkAuthorization();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
    ),
  );

  runApp(
    EasyLocalization(
      supportedLocales: APP_LOCALES.map((e) => Locale(e)).toList(),
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with StateUtilsMixin {
  final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: OrientationBuilder(
        builder: (context, orientation) => ScreenUtilInit(
          //  allowFontScaling: false,
          designSize: orientation == Orientation.portrait
              ? Size(375, 812)
              : Size(812, 375),
          builder: () => GetMaterialApp(
            title: 'Antares Market',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: defaultThemeData,
            debugShowCheckedModeBanner: true,
            onGenerateInitialRoutes: (_) {
              return [
                AppRoutes.generateRoute(
                  RouteSettings(name: AppRoutes.MAIN),
                  _routeObserver,
                ),
              ];
            },
            onGenerateRoute: (route) => AppRoutes.generateRoute(
              route,
              _routeObserver,
            ),
          ).onTap(unfocusCurrent),
        ),
      ),
    );
  }
}
