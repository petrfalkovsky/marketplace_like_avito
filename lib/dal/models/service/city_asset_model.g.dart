// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_asset_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CityAssetModelCopyWith on CityAssetModel {
  CityAssetModel copyWith({
    String? country,
    String? en,
    String? id,
    String? ru,
  }) {
    return CityAssetModel(
      country: country ?? this.country,
      en: en ?? this.en,
      id: id ?? this.id,
      ru: ru ?? this.ru,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityAssetModel _$CityAssetModelFromJson(Map<String, dynamic> json) {
  return CityAssetModel(
    id: json['_id'] as String? ?? '',
    en: json['en'] as String? ?? '',
    ru: json['ru'] as String? ?? '',
    country: json['country'] as String? ?? '',
  );
}

Map<String, dynamic> _$CityAssetModelToJson(CityAssetModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'en': instance.en,
      'ru': instance.ru,
      'country': instance.country,
    };
