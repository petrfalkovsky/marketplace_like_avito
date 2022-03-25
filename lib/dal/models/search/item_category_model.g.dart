// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_category_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ItemCategoryModelCopyWith on ItemCategoryModel {
  ItemCategoryModel copyWith({
    String? id,
    String? name,
    List<CategoryPropertyModel>? properties,
    CategoryShowMainModel? showMain,
    List<ItemCategoryModel>? subCategories,
    String? uri,
  }) {
    return ItemCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      properties: properties ?? this.properties,
      showMain: showMain ?? this.showMain,
      subCategories: subCategories ?? this.subCategories,
      uri: uri ?? this.uri,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCategoryModel _$ItemCategoryModelFromJson(Map<String, dynamic> json) {
  return ItemCategoryModel(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    uri: json['uri'] as String? ?? '',
    showMain: json['show_main'] == null
        ? null
        : CategoryShowMainModel.fromJson(
            json['show_main'] as Map<String, dynamic>),
    subCategories: (json['subCategories'] as List<dynamic>?)
            ?.map((e) => ItemCategoryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    properties: (json['properties'] as List<dynamic>?)
            ?.map((e) =>
                CategoryPropertyModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ItemCategoryModelToJson(ItemCategoryModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'uri': instance.uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('show_main', instance.showMain?.toJson());
  val['subCategories'] = instance.subCategories.map((e) => e.toJson()).toList();
  val['properties'] = instance.properties.map((e) => e.toJson()).toList();
  return val;
}
