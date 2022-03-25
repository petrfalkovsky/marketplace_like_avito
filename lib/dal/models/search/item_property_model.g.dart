// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_property_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ItemPropertyModelCopyWith on ItemPropertyModel {
  ItemPropertyModel copyWith({
    String? id,
    dynamic? property,
    dynamic? subValue,
    dynamic? value,
  }) {
    return ItemPropertyModel(
      id: id ?? this.id,
      property: property ?? this.property,
      subValue: subValue ?? this.subValue,
      value: value ?? this.value,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPropertyModel _$ItemPropertyModelFromJson(Map<String, dynamic> json) {
  return ItemPropertyModel(
    id: json['id'] as String? ?? '',
    property: json['property'],
    value: json['value'],
    subValue: json['subValue'],
  );
}

Map<String, dynamic> _$ItemPropertyModelToJson(ItemPropertyModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('property', instance.property);
  writeNotNull('value', instance.value);
  writeNotNull('subValue', instance.subValue);
  return val;
}
