import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'count_new_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class CountNewModel {
  @JsonKey(defaultValue: [])
  final List<dynamic> orders;
  @JsonKey(defaultValue: [])
  final List<dynamic> chats;

  CountNewModel({
    required this.orders,
    required this.chats,
  });

  factory CountNewModel.fromJson(Map<String, dynamic> json) =>
      _$CountNewModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountNewModelToJson(this);
}
