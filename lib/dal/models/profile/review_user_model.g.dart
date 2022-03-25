// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ReviewUserModelCopyWith on ReviewUserModel {
  ReviewUserModel copyWith({
    List<UserMiniToReviewModel>? author,
    String? comment,
    DateTime? createdAt,
    String? id,
    List<dynamic>? product,
    String? status,
    DateTime? updatedAt,
    List<UserMiniToReviewModel>? user,
    int? value,
  }) {
    return ReviewUserModel(
      author: author ?? this.author,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      product: product ?? this.product,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      value: value ?? this.value,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewUserModel _$ReviewUserModelFromJson(Map<String, dynamic> json) {
  return ReviewUserModel(
    author: (json['author'] as List<dynamic>)
        .map((e) => UserMiniToReviewModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    comment: json['comment'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    product: json['product'] as List<dynamic>,
    status: json['status'] as String? ?? '',
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    user: (json['user'] as List<dynamic>)
        .map((e) => UserMiniToReviewModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    value: json['value'] as int? ?? 0,
    id: json['_id'] as String? ?? '',
  );
}

Map<String, dynamic> _$ReviewUserModelToJson(ReviewUserModel instance) {
  final val = <String, dynamic>{
    'author': instance.author.map((e) => e.toJson()).toList(),
    'comment': instance.comment,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  val['product'] = instance.product;
  val['status'] = instance.status;
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  val['user'] = instance.user.map((e) => e.toJson()).toList();
  val['value'] = instance.value;
  val['_id'] = instance.id;
  return val;
}
