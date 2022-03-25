import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_user_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ReviewUserModel {
  final List<UserMiniToReviewModel> author;
  final String comment;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  final List<dynamic> product;
  @JsonKey(defaultValue: '')
  final String status;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  final List<UserMiniToReviewModel> user;
  @JsonKey(defaultValue: 0)
  final int value;
  @JsonKey(defaultValue: '', name: '_id')
  final String id;

  ReviewUserModel({
    required this.author,
    required this.comment,
    required this.createdAt,
    required this.product,
    required this.status,
    required this.updatedAt,
    required this.user,
    required this.value,
    required this.id,
  });
  factory ReviewUserModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewUserModelToJson(this);
}
