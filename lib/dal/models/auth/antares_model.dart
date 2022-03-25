import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'antares_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class AntaresModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: false)
  final bool isVerified;

  AntaresModel({
    required this.id,
    required this.isVerified,
  });

  factory AntaresModel.fromJson(Map<String, dynamic> json) =>
      _$AntaresModelFromJson(json);
  Map<String, dynamic> toJson() => _$AntaresModelToJson(this);
}
