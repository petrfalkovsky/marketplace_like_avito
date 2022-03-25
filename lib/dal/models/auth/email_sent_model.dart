import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_sent_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class EmailSentModel {
  @JsonKey(defaultValue: 0)
  final int count;
  final DateTime? lastSent;

  EmailSentModel({
    required this.count,
    required this.lastSent,
  });

  factory EmailSentModel.fromJson(Map<String, dynamic> json) =>
      _$EmailSentModelFromJson(json);
  Map<String, dynamic> toJson() => _$EmailSentModelToJson(this);
}
