// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_show_main_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CategoryShowMainModelCopyWith on CategoryShowMainModel {
  CategoryShowMainModel copyWith({
    bool? menu,
  }) {
    return CategoryShowMainModel(
      menu: menu ?? this.menu,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryShowMainModel _$CategoryShowMainModelFromJson(
    Map<String, dynamic> json) {
  return CategoryShowMainModel(
    menu: json['menu'] as bool? ?? false,
  );
}

Map<String, dynamic> _$CategoryShowMainModelToJson(
        CategoryShowMainModel instance) =>
    <String, dynamic>{
      'menu': instance.menu,
    };
