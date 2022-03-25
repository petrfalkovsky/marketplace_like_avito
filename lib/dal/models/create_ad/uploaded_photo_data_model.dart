import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'uploaded_photo_data_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class UploadedPhotoDataModel {
  @JsonKey(defaultValue: '')
  final String filename;
  @JsonKey(defaultValue: '')
  final String mimeType;
  @JsonKey(defaultValue: '')
  final String originalName;
  final int size;
  @JsonKey(defaultValue: '')
  final String url;

  UploadedPhotoDataModel({
    required this.filename,
    required this.mimeType,
    required this.originalName,
    required this.size,
    required this.url,
  });

  factory UploadedPhotoDataModel.fromJson(Map<String, dynamic> json) =>
      _$UploadedPhotoDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedPhotoDataModelToJson(this);
}
