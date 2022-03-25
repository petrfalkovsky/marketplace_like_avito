import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_property_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class CategoryPropertyModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: false)
  final bool multiple;
  @JsonKey(defaultValue: [], name: 'listOptions')
  final List<PropertyOptionModel> listOptions;
  final PropertyRulesModel? rules;

  CategoryPropertyModel({
    required this.id,
    required this.title,
    required this.type,
    required this.multiple,
    required this.listOptions,
    required this.rules,
  });

  factory CategoryPropertyModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryPropertyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryPropertyModelToJson(this);
}
