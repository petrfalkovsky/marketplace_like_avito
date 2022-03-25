import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_property_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ItemPropertyModel {
  @JsonKey(defaultValue: '')
  final String id;
  final dynamic property;
  final dynamic value;
  @JsonKey(name: 'subValue')
  final dynamic subValue;

  ItemPropertyModel({
    required this.id,
    required this.property,
    required this.value,
    required this.subValue,
  });

  factory ItemPropertyModel.fromJson(Map<String, dynamic> json) =>
      _$ItemPropertyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemPropertyModelToJson(this);
}
