import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_show_main_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class CategoryShowMainModel {
  @JsonKey(defaultValue: false)
  final bool menu;

  CategoryShowMainModel({
    required this.menu,
  });

  factory CategoryShowMainModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryShowMainModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryShowMainModelToJson(this);
}
