import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_subscriber_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class UserSubscriptionModel {
  @JsonKey(defaultValue: '', name: '_id')
  final String id;
  @JsonKey(defaultValue: '', name: 'first_name')
  final String firstName;
  @JsonKey(defaultValue: '', name: 'last_name')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String avatar;
  @JsonKey(defaultValue: '')
  final String email;

  UserSubscriptionModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.email,
  });

  factory UserSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSubscriptionModelToJson(this);
}
