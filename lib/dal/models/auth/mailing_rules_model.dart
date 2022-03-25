import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mailing_rules_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class MailingRulesModel {
  @JsonKey(defaultValue: 0)
  final int messages;
  @JsonKey(defaultValue: 0)
  final int reviews;
  @JsonKey(defaultValue: 0)
  final int news;
  @JsonKey(defaultValue: 0)
  final int products;

  MailingRulesModel({
    required this.messages,
    required this.reviews,
    required this.news,
    required this.products,
  });

  factory MailingRulesModel.fromJson(Map<String, dynamic> json) =>
      _$MailingRulesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MailingRulesModelToJson(this);
}
