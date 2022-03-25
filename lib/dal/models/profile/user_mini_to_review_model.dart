import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_mini_to_review_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class UserMiniToReviewModel {
  @JsonKey(defaultValue: '')
  final String avatar;
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '', name: '_id')
  final String id;

  UserMiniToReviewModel({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.id,
  });
  factory UserMiniToReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UserMiniToReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserMiniToReviewModelToJson(this);
}
