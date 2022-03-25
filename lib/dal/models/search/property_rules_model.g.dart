// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_rules_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension PropertyRulesModelCopyWith on PropertyRulesModel {
  PropertyRulesModel copyWith({
    bool? float,
    double? max,
    double? min,
    bool? multiple,
    bool? overflow,
  }) {
    return PropertyRulesModel(
      float: float ?? this.float,
      max: max ?? this.max,
      min: min ?? this.min,
      multiple: multiple ?? this.multiple,
      overflow: overflow ?? this.overflow,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyRulesModel _$PropertyRulesModelFromJson(Map<String, dynamic> json) {
  return PropertyRulesModel(
    min: (json['min'] as num?)?.toDouble() ?? 0,
    max: (json['max'] as num?)?.toDouble() ?? 0,
    overflow: json['overflow'] as bool? ?? false,
    multiple: json['multiple'] as bool? ?? false,
    float: json['float'] as bool? ?? false,
  );
}

Map<String, dynamic> _$PropertyRulesModelToJson(PropertyRulesModel instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'overflow': instance.overflow,
      'multiple': instance.multiple,
      'float': instance.float,
    };
