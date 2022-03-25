import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'referrer_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ReferrerModel {
  @JsonKey(defaultValue: '')
  final String referralCode;
  @JsonKey(defaultValue: '')
  final String invitedBy;
  final dynamic walletAddress;

  ReferrerModel({
    required this.referralCode,
    required this.invitedBy,
    required this.walletAddress,
  });

  factory ReferrerModel.fromJson(Map<String, dynamic> json) =>
      _$ReferrerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReferrerModelToJson(this);
}
