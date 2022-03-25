import 'dart:convert';

import 'package:antares_market/dal/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences prefs;
  AppPreferences._();

  static UserInfoModel? get user => _readJson(
        key: 'user',
        builder: (map) => UserInfoModel.fromJson(map),
      );
  static Future<bool> setUser(UserInfoModel? value) => _saveJson(
        key: 'user',
        builder: () => value?.toJson(),
      );

  static CountryAssetModel? get userCountry => _readJson(
        key: 'userCountry',
        builder: (map) => CountryAssetModel.fromJson(map),
      );
  static Future<bool> setUserCountry(CountryAssetModel? value) => _saveJson(
        key: 'userCountry',
        builder: () => value?.toJson(),
      );

  static CityAssetModel? get userCity => _readJson(
        key: 'userCity',
        builder: (map) => CityAssetModel.fromJson(map),
      );
  static Future<bool> setUserCity(CityAssetModel? value) => _saveJson(
        key: 'userCity',
        builder: () => value?.toJson(),
      );

  //////
  /// Private area
  //////

  static Future<bool> _setOrRemovePrimitive<T>(String key, T? value) {
    if (value == null) {
      return prefs.remove(key);
    }

    if (value is String) return prefs.setString(key, value);
    if (value is bool) return prefs.setBool(key, value);
    if (value is int) return prefs.setInt(key, value);
    if (value is double) return prefs.setDouble(key, value);
    if (value is List<String>) return prefs.setStringList(key, value);

    throw ArgumentError.value(value, 'value');
  }

  static T? _readJson<T>({
    required String key,
    required T builder(dynamic json),
    T? defaultValue,
  }) {
    try {
      final string = prefs.getString(key) ?? '';
      if (string.isEmpty) {
        return defaultValue;
      }
      final obj = jsonDecode(string);
      return builder(obj);
    } catch (e) {
      return defaultValue;
    }
  }

  static Future<bool> _saveJson({
    required String key,
    required dynamic builder(),
  }) {
    try {
      final obj = builder();
      if (obj == null) {
        return prefs.remove(key);
      }
      return prefs.setString(key, jsonEncode(obj));
    } catch (e) {
      return prefs.remove(key);
    }
  }
}
