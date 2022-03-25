// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mini_to_review_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserMiniToReviewModelCopyWith on UserMiniToReviewModel {
  UserMiniToReviewModel copyWith({
    String? avatar,
    String? firstName,
    String? id,
    String? lastName,
  }) {
    return UserMiniToReviewModel(
      avatar: avatar ?? this.avatar,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMiniToReviewModel _$UserMiniToReviewModelFromJson(
    Map<String, dynamic> json) {
  return UserMiniToReviewModel(
    avatar: json['avatar'] as String? ?? '',
    firstName: json['first_name'] as String? ?? '',
    lastName: json['last_name'] as String? ?? '',
    id: json['_id'] as String? ?? '',
  );
}

Map<String, dynamic> _$UserMiniToReviewModelToJson(
        UserMiniToReviewModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      '_id': instance.id,
    };
