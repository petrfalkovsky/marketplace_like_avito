// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_asset_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CountryAssetModelCopyWith on CountryAssetModel {
  CountryAssetModel copyWith({
    String? en,
    String? id,
    String? ru,
  }) {
    return CountryAssetModel(
      en: en ?? this.en,
      id: id ?? this.id,
      ru: ru ?? this.ru,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryAssetModel _$CountryAssetModelFromJson(Map<String, dynamic> json) {
  return CountryAssetModel(
    id: json['id'] as String? ?? '',
    en: json['en'] as String? ?? '',
    ru: json['ru'] as String? ?? '',
  );
}

Map<String, dynamic> _$CountryAssetModelToJson(CountryAssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'en': instance.en,
      'ru': instance.ru,
    };
