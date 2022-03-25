import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_email_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ConfirmEmailModel {
  final DateTime? createDate;
  final EmailSentModel? emailsSent;
  @JsonKey(defaultValue: false)
  final bool isConfirmed;

  ConfirmEmailModel({
    required this.createDate,
    required this.emailsSent,
    required this.isConfirmed,
  });
  factory ConfirmEmailModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmEmailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmEmailModelToJson(this);
}
