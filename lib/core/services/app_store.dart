import 'dart:convert';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';

class AppStore {
  AppStore() {
    AssetReader.loadAsset(
      'assets/translations/location/cities.json',
    ).then((_value) {
      List items = jsonDecode(_value);

      allCities.push(
        items.map((_item) => CityAssetModel.fromJson(_item)).toList(),
      );
    });
    AssetReader.loadAsset(
      'assets/translations/location/countries.json',
    ).then((_value) {
      List items = jsonDecode(_value);

      allCities.push(
        items.map((_item) => CityAssetModel.fromJson(_item)).toList(),
      );
    });
  }

  final Observable<List<CountryAssetModel>> allCountries = Observable(
    value: [],
  );
  final Observable<List<CityAssetModel>> allCities = Observable(
    value: [],
  );
  final Observable<SearchFilterModel?> searchFilter = Observable(value: null);

  void dispose() {
    allCountries.dispose();
    allCities.dispose();
  }
}
