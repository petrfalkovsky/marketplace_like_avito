// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_to_create_ad_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension PropertiesToCreateAdModelCopyWith on PropertiesToCreateAdModel {
  PropertiesToCreateAdModel copyWith({
    String? property,
    dynamic? subValue,
    dynamic? value,
  }) {
    return PropertiesToCreateAdModel(
      property: property ?? this.property,
      subValue: subValue ?? this.subValue,
      value: value ?? this.value,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertiesToCreateAdModel _$PropertiesToCreateAdModelFromJson(
    Map<String, dynamic> json) {
  return PropertiesToCreateAdModel(
    property: json['property'] as String? ?? '',
    value: json['value'] ?? '',
    subValue: json['sub_value'] ?? '',
  );
}

Map<String, dynamic> _$PropertiesToCreateAdModelToJson(
    PropertiesToCreateAdModel instance) {
  final val = <String, dynamic>{
    'property': instance.property,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('sub_value', instance.subValue);
  return val;
}
