// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'antares_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension AntaresModelCopyWith on AntaresModel {
  AntaresModel copyWith({
    String? id,
    bool? isVerified,
  }) {
    return AntaresModel(
      id: id ?? this.id,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AntaresModel _$AntaresModelFromJson(Map<String, dynamic> json) {
  return AntaresModel(
    id: json['id'] as String? ?? '',
    isVerified: json['is_verified'] as bool? ?? false,
  );
}

Map<String, dynamic> _$AntaresModelToJson(AntaresModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_verified': instance.isVerified,
    };
