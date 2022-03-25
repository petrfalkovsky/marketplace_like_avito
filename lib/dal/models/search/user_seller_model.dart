import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_seller_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class UserSellerModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String avatar;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String email;

  UserSellerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.phone,
    required this.email,
  });

  factory UserSellerModel.fromJson(Map<String, dynamic> json) =>
      _$UserSellerModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSellerModelToJson(this);
}
