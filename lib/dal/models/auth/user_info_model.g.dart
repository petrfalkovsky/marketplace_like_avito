// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserInfoModelCopyWith on UserInfoModel {
  UserInfoModel copyWith({
    AntaresModel? antares,
    String? avatar,
    BalanceModel? balance,
    String? city,
    int? clientId,
    CountNewModel? countNew,
    String? country,
    String? email,
    bool? emailIsConfirmed,
    EmailSentModel? emailSent,
    String? firstName,
    String? id,
    String? lang,
    String? lastName,
    MailingRulesModel? mailingRules,
    String? partnershipId,
    String? phone,
    ReferrerModel? referrer,
    dynamic? returnAddress,
    String? role,
    CityModel? selectedCity,
    String? status,
    List<dynamic>? subscribe,
  }) {
    return UserInfoModel(
      antares: antares ?? this.antares,
      avatar: avatar ?? this.avatar,
      balance: balance ?? this.balance,
      city: city ?? this.city,
      clientId: clientId ?? this.clientId,
      countNew: countNew ?? this.countNew,
      country: country ?? this.country,
      email: email ?? this.email,
      emailIsConfirmed: emailIsConfirmed ?? this.emailIsConfirmed,
      emailSent: emailSent ?? this.emailSent,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lang: lang ?? this.lang,
      lastName: lastName ?? this.lastName,
      mailingRules: mailingRules ?? this.mailingRules,
      partnershipId: partnershipId ?? this.partnershipId,
      phone: phone ?? this.phone,
      referrer: referrer ?? this.referrer,
      returnAddress: returnAddress ?? this.returnAddress,
      role: role ?? this.role,
      selectedCity: selectedCity ?? this.selectedCity,
      status: status ?? this.status,
      subscribe: subscribe ?? this.subscribe,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return UserInfoModel(
    firstName: json['first_name'] as String? ?? '',
    lastName: json['last_name'] as String? ?? '',
    id: json['id'] as String? ?? '',
    status: json['status'] as String? ?? '',
    email: json['email'] as String? ?? '',
    emailIsConfirmed: json['email_is_confirmed'] as bool? ?? false,
    country: json['country'] as String? ?? '',
    city: json['city'] as String? ?? '',
    selectedCity: json['selected_city'] == null
        ? null
        : CityModel.fromJson(json['selected_city'] as Map<String, dynamic>),
    phone: json['phone'] as String? ?? '',
    role: json['role'] as String? ?? '',
    countNew: json['count_new'] == null
        ? null
        : CountNewModel.fromJson(json['count_new'] as Map<String, dynamic>),
    returnAddress: json['return_address'],
    referrer: json['referrer'] == null
        ? null
        : ReferrerModel.fromJson(json['referrer'] as Map<String, dynamic>),
    antares: json['antares'] == null
        ? null
        : AntaresModel.fromJson(json['antares'] as Map<String, dynamic>),
    avatar: json['avatar'] as String? ?? '',
    mailingRules: json['mailing_rules'] == null
        ? null
        : MailingRulesModel.fromJson(
            json['mailing_rules'] as Map<String, dynamic>),
    balance: json['balance'] == null
        ? null
        : BalanceModel.fromJson(json['balance'] as Map<String, dynamic>),
    clientId: json['client_id'] as int? ?? 0,
    lang: json['lang'] as String? ?? '',
    emailSent: json['email_sent'] == null
        ? null
        : EmailSentModel.fromJson(json['email_sent'] as Map<String, dynamic>),
    partnershipId: json['partnership_id'] as String? ?? '',
    subscribe: json['subscribe'] as List<dynamic>? ?? [],
  );
}

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) {
  final val = <String, dynamic>{
    'first_name': instance.firstName,
    'last_name': instance.lastName,
    'id': instance.id,
    'status': instance.status,
    'email': instance.email,
    'email_is_confirmed': instance.emailIsConfirmed,
    'country': instance.country,
    'city': instance.city,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('selected_city', instance.selectedCity?.toJson());
  val['phone'] = instance.phone;
  val['role'] = instance.role;
  writeNotNull('count_new', instance.countNew?.toJson());
  writeNotNull('return_address', instance.returnAddress);
  writeNotNull('referrer', instance.referrer?.toJson());
  writeNotNull('antares', instance.antares?.toJson());
  val['avatar'] = instance.avatar;
  writeNotNull('mailing_rules', instance.mailingRules?.toJson());
  writeNotNull('balance', instance.balance?.toJson());
  val['client_id'] = instance.clientId;
  val['lang'] = instance.lang;
  writeNotNull('email_sent', instance.emailSent?.toJson());
  val['partnership_id'] = instance.partnershipId;
  val['subscribe'] = instance.subscribe;
  return val;
}
