// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CityModelCopyWith on CityModel {
  CityModel copyWith({
    String? id,
    String? name,
    String? uri,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uri: uri ?? this.uri,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return CityModel(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    uri: json['uri'] as String? ?? '',
  );
}

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uri': instance.uri,
    };
