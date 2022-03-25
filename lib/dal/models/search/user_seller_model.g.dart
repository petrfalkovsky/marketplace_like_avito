// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_seller_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserSellerModelCopyWith on UserSellerModel {
  UserSellerModel copyWith({
    String? avatar,
    String? email,
    String? firstName,
    String? id,
    String? lastName,
    String? phone,
  }) {
    return UserSellerModel(
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSellerModel _$UserSellerModelFromJson(Map<String, dynamic> json) {
  return UserSellerModel(
    id: json['id'] as String? ?? '',
    firstName: json['first_name'] as String? ?? '',
    lastName: json['last_name'] as String? ?? '',
    avatar: json['avatar'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    email: json['email'] as String? ?? '',
  );
}

Map<String, dynamic> _$UserSellerModelToJson(UserSellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'email': instance.email,
    };
