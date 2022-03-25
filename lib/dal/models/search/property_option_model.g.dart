// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_option_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension PropertyOptionModelCopyWith on PropertyOptionModel {
  PropertyOptionModel copyWith({
    String? id,
    List<PropertyOptionModel>? subOptions,
    String? title,
  }) {
    return PropertyOptionModel(
      id: id ?? this.id,
      subOptions: subOptions ?? this.subOptions,
      title: title ?? this.title,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyOptionModel _$PropertyOptionModelFromJson(Map<String, dynamic> json) {
  return PropertyOptionModel(
    id: json['id'] as String? ?? '',
    title: json['title'] as String? ?? '',
    subOptions: (json['subOptions'] as List<dynamic>?)
            ?.map(
                (e) => PropertyOptionModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$PropertyOptionModelToJson(
        PropertyOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subOptions': instance.subOptions.map((e) => e.toJson()).toList(),
    };
