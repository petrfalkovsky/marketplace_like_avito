// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_photo_data_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UploadedPhotoDataModelCopyWith on UploadedPhotoDataModel {
  UploadedPhotoDataModel copyWith({
    String? filename,
    String? mimeType,
    String? originalName,
    int? size,
    String? url,
  }) {
    return UploadedPhotoDataModel(
      filename: filename ?? this.filename,
      mimeType: mimeType ?? this.mimeType,
      originalName: originalName ?? this.originalName,
      size: size ?? this.size,
      url: url ?? this.url,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedPhotoDataModel _$UploadedPhotoDataModelFromJson(
    Map<String, dynamic> json) {
  return UploadedPhotoDataModel(
    filename: json['filename'] as String? ?? '',
    mimeType: json['mime_type'] as String? ?? '',
    originalName: json['original_name'] as String? ?? '',
    size: json['size'] as int,
    url: json['url'] as String? ?? '',
  );
}

Map<String, dynamic> _$UploadedPhotoDataModelToJson(
        UploadedPhotoDataModel instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'mime_type': instance.mimeType,
      'original_name': instance.originalName,
      'size': instance.size,
      'url': instance.url,
    };
