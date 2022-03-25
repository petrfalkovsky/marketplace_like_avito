import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_category_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ItemCategoryModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String uri;
  final CategoryShowMainModel? showMain;
  @JsonKey(defaultValue: [], name: 'subCategories')
  final List<ItemCategoryModel> subCategories;
  @JsonKey(defaultValue: [])
  final List<CategoryPropertyModel> properties;

  ItemCategoryModel({
    required this.id,
    required this.name,
    required this.uri,
    required this.showMain,
    required this.subCategories,
    required this.properties,
  });

  factory ItemCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemCategoryModelToJson(this);
}
