import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_item_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class FavoriteItemModel {
  @JsonKey(defaultValue: '', name: '_id')
  final String id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String uri;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String category;
  @JsonKey(defaultValue: '', name: 'user_seller')
  final String userSeller;
  @JsonKey(defaultValue: '')
  final String status;
  @JsonKey(defaultValue: 0, name: 'count_views')
  final int countViews;
  @JsonKey(defaultValue: 0, name: 'usd_price')
  final double usdPrice;
  @JsonKey(defaultValue: [])
  final List<PriceModel> prices;
  @JsonKey(defaultValue: [], name: 'photos_filenames')
  final List<String> photosFilenames;
  @JsonKey(name: 'createdAt')
  final DateTime? created;
  final String? city;

  FavoriteItemModel({
    required this.id,
    required this.title,
    required this.uri,
    required this.description,
    required this.category,
    required this.userSeller,
    required this.status,
    required this.countViews,
    required this.usdPrice,
    required this.prices,
    required this.photosFilenames,
    required this.created,
    required this.city,
  });

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteItemModelToJson(this);
}
