// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_simple_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserSimpleModelCopyWith on UserSimpleModel {
  UserSimpleModel copyWith({
    AntaresModel? antares,
    String? avatar,
    BalanceModel? balance,
    dynamic? blockReason,
    int? clientId,
    ConfirmEmailModel? confirmEmail,
    DateTime? createdAt,
    String? email,
    String? firstName,
    String? id,
    String? lastName,
    String? phone,
    String? role,
    String? status,
    List<dynamic>? subscribe,
  }) {
    return UserSimpleModel(
      antares: antares ?? this.antares,
      avatar: avatar ?? this.avatar,
      balance: balance ?? this.balance,
      blockReason: blockReason ?? this.blockReason,
      clientId: clientId ?? this.clientId,
      confirmEmail: confirmEmail ?? this.confirmEmail,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      status: status ?? this.status,
      subscribe: subscribe ?? this.subscribe,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSimpleModel _$UserSimpleModelFromJson(Map<String, dynamic> json) {
  return UserSimpleModel(
    firstName: json['first_name'] as String? ?? '',
    lastName: json['last_name'] as String? ?? '',
    id: json['id'] as String? ?? '',
    antares: json['antares'] == null
        ? null
        : AntaresModel.fromJson(json['antares'] as Map<String, dynamic>),
    avatar: json['avatar'] as String? ?? '',
    balance: json['balance'] == null
        ? null
        : BalanceModel.fromJson(json['balance'] as Map<String, dynamic>),
    clientId: json['client_id'] as int? ?? 0,
    blockReason: json['block_reason'],
    confirmEmail: json['confirm_email'] == null
        ? null
        : ConfirmEmailModel.fromJson(
            json['confirm_email'] as Map<String, dynamic>),
    createdAt: DateTime.parse(json['createdAt'] as String),
    email: json['email'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    role: json['role'] as String? ?? '',
    status: json['status'] as String? ?? '',
    subscribe: json['subscribe'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$UserSimpleModelToJson(UserSimpleModel instance) {
  final val = <String, dynamic>{
    'first_name': instance.firstName,
    'last_name': instance.lastName,
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('antares', instance.antares?.toJson());
  val['avatar'] = instance.avatar;
  writeNotNull('balance', instance.balance?.toJson());
  val['client_id'] = instance.clientId;
  writeNotNull('block_reason', instance.blockReason);
  writeNotNull('confirm_email', instance.confirmEmail?.toJson());
  val['createdAt'] = instance.createdAt.toIso8601String();
  val['email'] = instance.email;
  val['phone'] = instance.phone;
  val['role'] = instance.role;
  val['status'] = instance.status;
  writeNotNull('subscribe', instance.subscribe);
  return val;
}
