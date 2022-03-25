import 'dart:io';

import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.I;

final blocProviders = <BlocProvider>[
  BlocProvider<SearchBloc>(
    create: (context) => getIt<SearchBloc>(),
  ),
  BlocProvider<ItemBloc>(
    create: (context) => getIt<ItemBloc>(),
  ),
  BlocProvider<LoginBloc>(
    create: (context) => getIt<LoginBloc>(),
  ),
  BlocProvider<PurchaseBloc>(
    create: (context) => getIt<PurchaseBloc>(),
  ),
  BlocProvider<CreateAdBloc>(
    create: (context) => getIt<CreateAdBloc>(),
  ),
  BlocProvider<FavoritesBloc>(
    create: (context) => getIt<FavoritesBloc>(),
  ),
  BlocProvider<ProfileBloc>(
    create: (context) => getIt<ProfileBloc>(),
  ),
  BlocProvider<UserProfileBloc>(
    create: (context) => getIt<UserProfileBloc>(),
  ),
];

Future getItSetup({required Directory appDocDir}) async {
  BaseOptions options = BaseOptions(
    connectTimeout: 100000,
    receiveTimeout: 15000,
  );

  getIt.registerLazySingleton(() => Dio(options));
  getIt.registerLazySingleton<CookieJar>(
    () => PersistCookieJar(
      storage: FileStorage(appDocDir.path + '/.cookies/'),
    ),
  );
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerLazySingleton(() => CookieManager(getIt()));
  getIt.registerLazySingleton(() => Dal(dio: getIt()));
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton(() => MessageBus());
  getIt.registerLazySingleton(() => AppStore());

  // Bloc
  // === Features - Search
  getIt.registerFactory(
    () => SearchBloc(
      dal: getIt(),
      appStore: getIt(),
    ),
  );
  getIt.registerFactory(() => ItemBloc(dal: getIt()));
  getIt.registerFactory(() => PurchaseBloc(dal: getIt()));
  // === Features - Auth
  getIt.registerFactory(() => LoginBloc(dal: getIt()));
  // === Features - CreateAd
  getIt.registerFactory(() => CreateAdBloc(
        dal: getIt(),
        appStore: getIt(),
      ));
  // === Features - Profile
  getIt.registerFactory(() => ProfileBloc(dal: getIt()));
  // === Features - Profile - Favorites
  getIt.registerFactory(() => FavoritesBloc(dal: getIt()));
  // === Features - Profile - UserProfile
  getIt.registerFactory(() => UserProfileBloc(dal: getIt()));
}
