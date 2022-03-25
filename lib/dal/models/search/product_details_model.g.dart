// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ProductDetailsModelCopyWith on ProductDetailsModel {
  ProductDetailsModel copyWith({
    String? category,
    CityModel? city,
    int? countViews,
    DateTime? created,
    bool? demo,
    String? description,
    String? id,
    bool? isFavorite,
    List<dynamic>? orders,
    String? phone,
    List<PhotoModel>? photosFilenames,
    List<PriceModel>? prices,
    List<ItemPropertyModel>? properties,
    String? status,
    String? title,
    String? uri,
    double? usdPrice,
    UserSellerModel? userSeller,
  }) {
    return ProductDetailsModel(
      category: category ?? this.category,
      city: city ?? this.city,
      countViews: countViews ?? this.countViews,
      created: created ?? this.created,
      demo: demo ?? this.demo,
      description: description ?? this.description,
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
      orders: orders ?? this.orders,
      phone: phone ?? this.phone,
      photosFilenames: photosFilenames ?? this.photosFilenames,
      prices: prices ?? this.prices,
      properties: properties ?? this.properties,
      status: status ?? this.status,
      title: title ?? this.title,
      uri: uri ?? this.uri,
      usdPrice: usdPrice ?? this.usdPrice,
      userSeller: userSeller ?? this.userSeller,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) {
  return ProductDetailsModel(
    id: json['id'] as String? ?? '',
    title: json['title'] as String? ?? '',
    uri: json['uri'] as String? ?? '',
    description: json['description'] as String? ?? '',
    category: json['category'] as String? ?? '',
    userSeller: json['user_seller'] == null
        ? null
        : UserSellerModel.fromJson(json['user_seller'] as Map<String, dynamic>),
    status: json['status'] as String? ?? '',
    demo: json['demo'] as bool? ?? false,
    countViews: json['count_views'] as int? ?? 0,
    properties: (json['properties'] as List<dynamic>?)
            ?.map((e) => ItemPropertyModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    usdPrice: (json['usd_price'] as num?)?.toDouble() ?? 0,
    prices: (json['prices'] as List<dynamic>?)
            ?.map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    photosFilenames: (json['photos_filenames'] as List<dynamic>?)
            ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    orders: json['orders'] as List<dynamic>? ?? [],
    city: json['city'] == null
        ? null
        : CityModel.fromJson(json['city'] as Map<String, dynamic>),
    phone: json['phone'] as String? ?? '',
    isFavorite: json['isFavorite'] as bool? ?? false,
  );
}

Map<String, dynamic> _$ProductDetailsModelToJson(ProductDetailsModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'uri': instance.uri,
    'description': instance.description,
    'category': instance.category,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_seller', instance.userSeller?.toJson());
  val['status'] = instance.status;
  val['demo'] = instance.demo;
  val['count_views'] = instance.countViews;
  val['properties'] = instance.properties.map((e) => e.toJson()).toList();
  val['usd_price'] = instance.usdPrice;
  val['prices'] = instance.prices.map((e) => e.toJson()).toList();
  val['photos_filenames'] =
      instance.photosFilenames.map((e) => e.toJson()).toList();
  writeNotNull('created', instance.created?.toIso8601String());
  val['orders'] = instance.orders;
  writeNotNull('city', instance.city?.toJson());
  val['phone'] = instance.phone;
  val['isFavorite'] = instance.isFavorite;
  return val;
}
