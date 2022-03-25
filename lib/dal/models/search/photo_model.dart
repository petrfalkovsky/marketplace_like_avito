import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class PhotoModel {
  @JsonKey(defaultValue: '')
  final String original;
  @JsonKey(defaultValue: '', name: '100x100')
  final String oneHundred;
  @JsonKey(defaultValue: '', name: '200x200')
  final String twoHundred;
  @JsonKey(defaultValue: '', name: '500x500')
  final String fiveHundred;

  PhotoModel({
    required this.original,
    required this.oneHundred,
    required this.twoHundred,
    required this.fiveHundred,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
