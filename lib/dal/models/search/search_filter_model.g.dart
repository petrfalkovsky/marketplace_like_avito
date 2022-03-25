// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension SearchFilterModelCopyWith on SearchFilterModel {
  SearchFilterModel copyWith({
    CityAssetModel? city,
    CountryAssetModel? country,
    double? priceFrom,
    double? priceTo,
    String? sort,
    String? sortDestination,
  }) {
    return SearchFilterModel(
      city: city ?? this.city,
      country: country ?? this.country,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      sort: sort ?? this.sort,
      sortDestination: sortDestination ?? this.sortDestination,
    );
  }

  SearchFilterModel copyWithNull({
    bool city = false,
    bool country = false,
    bool priceFrom = false,
    bool priceTo = false,
    bool sort = false,
    bool sortDestination = false,
  }) {
    return SearchFilterModel(
      city: city == true ? null : this.city,
      country: country == true ? null : this.country,
      priceFrom: priceFrom == true ? null : this.priceFrom,
      priceTo: priceTo == true ? null : this.priceTo,
      sort: sort == true ? null : this.sort,
      sortDestination: sortDestination == true ? null : this.sortDestination,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFilterModel _$SearchFilterModelFromJson(Map<String, dynamic> json) {
  return SearchFilterModel(
    country: json['country'] == null
        ? null
        : CountryAssetModel.fromJson(json['country'] as Map<String, dynamic>),
    city: json['city'] == null
        ? null
        : CityAssetModel.fromJson(json['city'] as Map<String, dynamic>),
    priceFrom: (json['price_from'] as num?)?.toDouble(),
    priceTo: (json['price_to'] as num?)?.toDouble(),
    sort: json['sort'] as String?,
    sortDestination: json['sort_destination'] as String?,
  );
}

Map<String, dynamic> _$SearchFilterModelToJson(SearchFilterModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('country', instance.country?.toJson());
  writeNotNull('city', instance.city?.toJson());
  writeNotNull('price_from', instance.priceFrom);
  writeNotNull('price_to', instance.priceTo);
  writeNotNull('sort', instance.sort);
  writeNotNull('sort_destination', instance.sortDestination);
  return val;
}
