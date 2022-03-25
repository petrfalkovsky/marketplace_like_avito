import 'dart:convert';
import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/injection_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

part 'services/base/basic_service.dart';
part 'services/search_service.dart';
part 'services/auth_service.dart';
part 'services/favorites_service.dart';
part 'services/profile_service.dart';
part 'services/create_ad_service.dart';

class Dal {
  final Dio dio;

  final SearchService searchService;
  final AuthService authService;
  final FavoritesService favoritesService;
  final ProfileService profileService;
  final CreateAdService createAdService;

  Dal({required this.dio})
      : searchService = _SearchService(dio: dio),
        authService = _AuthService(dio: dio),
        favoritesService = _FavoritesService(dio: dio),
        profileService = _ProfileService(dio: dio),
        createAdService = _CreateAdService(dio: dio);
}
