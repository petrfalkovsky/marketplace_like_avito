// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_property_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CategoryPropertyModelCopyWith on CategoryPropertyModel {
  CategoryPropertyModel copyWith({
    String? id,
    List<PropertyOptionModel>? listOptions,
    bool? multiple,
    PropertyRulesModel? rules,
    String? title,
    String? type,
  }) {
    return CategoryPropertyModel(
      id: id ?? this.id,
      listOptions: listOptions ?? this.listOptions,
      multiple: multiple ?? this.multiple,
      rules: rules ?? this.rules,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryPropertyModel _$CategoryPropertyModelFromJson(
    Map<String, dynamic> json) {
  return CategoryPropertyModel(
    id: json['id'] as String? ?? '',
    title: json['title'] as String? ?? '',
    type: json['type'] as String? ?? '',
    multiple: json['multiple'] as bool? ?? false,
    listOptions: (json['listOptions'] as List<dynamic>?)
            ?.map(
                (e) => PropertyOptionModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    rules: json['rules'] == null
        ? null
        : PropertyRulesModel.fromJson(json['rules'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryPropertyModelToJson(
    CategoryPropertyModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'type': instance.type,
    'multiple': instance.multiple,
    'listOptions': instance.listOptions.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rules', instance.rules?.toJson());
  return val;
}
