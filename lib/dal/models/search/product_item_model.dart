import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_item_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ProductItemModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String uri;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String category;
  @JsonKey(defaultValue: '')
  final String userSeller;
  @JsonKey(defaultValue: '')
  final String status;
  @JsonKey(defaultValue: 0)
  final int countViews;
  @JsonKey(defaultValue: 0)
  final double usdPrice;
  @JsonKey(defaultValue: [])
  final List<PriceModel> prices;
  @JsonKey(defaultValue: [])
  final List<PhotoModel> photosFilenames;
  final DateTime? created;
  final CityModel? city;

  ProductItemModel({
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

  factory ProductItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProductItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemModelToJson(this);
}
