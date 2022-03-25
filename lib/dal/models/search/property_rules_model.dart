import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'property_rules_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class PropertyRulesModel {
  @JsonKey(defaultValue: 0)
  final double min;
  @JsonKey(defaultValue: 0)
  final double max;
  @JsonKey(defaultValue: false)
  final bool overflow;
  @JsonKey(defaultValue: false)
  final bool multiple;
  @JsonKey(defaultValue: false)
  final bool float;

  PropertyRulesModel({
    required this.min,
    required this.max,
    required this.overflow,
    required this.multiple,
    required this.float,
  });

  factory PropertyRulesModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyRulesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyRulesModelToJson(this);
}
