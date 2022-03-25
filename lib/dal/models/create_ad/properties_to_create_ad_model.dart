import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'properties_to_create_ad_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class PropertiesToCreateAdModel {
  @JsonKey(defaultValue: '')
  final String property;
  @JsonKey(defaultValue: '')
  final dynamic value;
  @JsonKey(defaultValue: '', name: 'sub_value')
  final dynamic subValue;

  PropertiesToCreateAdModel({
    required this.property,
    required this.value,
    this.subValue,
  });

  factory PropertiesToCreateAdModel.fromJson(Map<String, dynamic> json) =>
      _$PropertiesToCreateAdModelFromJson(json);
  Map<String, dynamic> toJson() => _$PropertiesToCreateAdModelToJson(this);
}
