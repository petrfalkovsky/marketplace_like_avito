import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedImageSource {
  static get({
    Key? key,
    required String url,
  }) async {
    return AppCacheManager().getSingleFile(url);
  }
}

class AppCacheManager extends CacheManager {
  static const key = 'appImagesCache';

  static AppCacheManager? _singleton;
  factory AppCacheManager() =>
      _singleton == null ? (_singleton = AppCacheManager._()) : _singleton!;

  AppCacheManager._()
      : super(Config(
          key,
          stalePeriod: const Duration(days: 7),
          maxNrOfCacheObjects: 100,
        ));
}
