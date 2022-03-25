// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension PhotoModelCopyWith on PhotoModel {
  PhotoModel copyWith({
    String? fiveHundred,
    String? oneHundred,
    String? original,
    String? twoHundred,
  }) {
    return PhotoModel(
      fiveHundred: fiveHundred ?? this.fiveHundred,
      oneHundred: oneHundred ?? this.oneHundred,
      original: original ?? this.original,
      twoHundred: twoHundred ?? this.twoHundred,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return PhotoModel(
    original: json['original'] as String? ?? '',
    oneHundred: json['100x100'] as String? ?? '',
    twoHundred: json['200x200'] as String? ?? '',
    fiveHundred: json['500x500'] as String? ?? '',
  );
}

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'original': instance.original,
      '100x100': instance.oneHundred,
      '200x200': instance.twoHundred,
      '500x500': instance.fiveHundred,
    };
