import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_simple_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class UserSimpleModel {
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String id;
  final AntaresModel? antares;
  @JsonKey(defaultValue: '')
  final String avatar;
  final BalanceModel? balance;
  @JsonKey(defaultValue: 0)
  final int clientId;
  final dynamic blockReason;
  final ConfirmEmailModel? confirmEmail;
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String role;
  @JsonKey(defaultValue: '')
  final String status;
  final List<dynamic>? subscribe;

  UserSimpleModel({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.antares,
    required this.avatar,
    required this.balance,
    required this.clientId,
    required this.blockReason,
    required this.confirmEmail,
    required this.createdAt,
    required this.email,
    required this.phone,
    required this.role,
    required this.status,
    required this.subscribe,
  });
  factory UserSimpleModel.fromJson(Map<String, dynamic> json) =>
      _$UserSimpleModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSimpleModelToJson(this);
}
