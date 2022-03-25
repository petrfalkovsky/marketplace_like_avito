import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'property_option_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class PropertyOptionModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: [], name: 'subOptions')
  final List<PropertyOptionModel> subOptions;

  PropertyOptionModel({
    required this.id,
    required this.title,
    required this.subOptions,
  });

  factory PropertyOptionModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyOptionModelToJson(this);
}
