// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscriber_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserSubscriptionModelCopyWith on UserSubscriptionModel {
  UserSubscriptionModel copyWith({
    String? avatar,
    String? email,
    String? firstName,
    String? id,
    String? lastName,
  }) {
    return UserSubscriptionModel(
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSubscriptionModel _$UserSubscriptionModelFromJson(
    Map<String, dynamic> json) {
  return UserSubscriptionModel(
    id: json['_id'] as String? ?? '',
    firstName: json['first_name'] as String? ?? '',
    lastName: json['last_name'] as String? ?? '',
    avatar: json['avatar'] as String? ?? '',
    email: json['email'] as String? ?? '',
  );
}

Map<String, dynamic> _$UserSubscriptionModelToJson(
        UserSubscriptionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
      'email': instance.email,
    };
