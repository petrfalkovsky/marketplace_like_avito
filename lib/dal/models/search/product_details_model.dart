import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ProductDetailsModel {
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
  final UserSellerModel? userSeller;
  @JsonKey(defaultValue: '')
  final String status;
  @JsonKey(defaultValue: false)
  final bool demo;
  @JsonKey(defaultValue: 0)
  final int countViews;
  @JsonKey(defaultValue: [])
  final List<ItemPropertyModel> properties;
  @JsonKey(defaultValue: 0)
  final double usdPrice;
  @JsonKey(defaultValue: [])
  final List<PriceModel> prices;
  @JsonKey(defaultValue: [])
  final List<PhotoModel> photosFilenames;
  final DateTime? created;
  @JsonKey(defaultValue: [])
  final List<dynamic> orders;
  final CityModel? city;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: false, name: 'isFavorite')
  final bool isFavorite;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.uri,
    required this.description,
    required this.category,
    required this.userSeller,
    required this.status,
    required this.demo,
    required this.countViews,
    required this.properties,
    required this.usdPrice,
    required this.prices,
    required this.photosFilenames,
    required this.created,
    required this.orders,
    required this.city,
    required this.phone,
    required this.isFavorite,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}
