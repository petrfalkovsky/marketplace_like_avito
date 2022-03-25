import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class UserInfoModel {
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String status;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: false)
  final bool emailIsConfirmed;
  @JsonKey(defaultValue: '')
  final String country;
  @JsonKey(defaultValue: '')
  final String city;
  final CityModel? selectedCity;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String role;
  final CountNewModel? countNew;
  final dynamic returnAddress;
  final ReferrerModel? referrer;
  final AntaresModel? antares;
  @JsonKey(defaultValue: '')
  final String avatar;
  final MailingRulesModel? mailingRules;
  final BalanceModel? balance;
  @JsonKey(defaultValue: 0)
  final int clientId;
  @JsonKey(defaultValue: '')
  final String lang;
  final EmailSentModel? emailSent;
  @JsonKey(defaultValue: '')
  final String partnershipId;
  @JsonKey(defaultValue: [])
  final List<dynamic> subscribe;

  UserInfoModel({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.status,
    required this.email,
    required this.emailIsConfirmed,
    required this.country,
    required this.city,
    required this.selectedCity,
    required this.phone,
    required this.role,
    required this.countNew,
    required this.returnAddress,
    required this.referrer,
    required this.antares,
    required this.avatar,
    required this.mailingRules,
    required this.balance,
    required this.clientId,
    required this.lang,
    required this.emailSent,
    required this.partnershipId,
    required this.subscribe,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
