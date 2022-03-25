// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ProductItemModelCopyWith on ProductItemModel {
  ProductItemModel copyWith({
    String? category,
    CityModel? city,
    int? countViews,
    DateTime? created,
    String? description,
    String? id,
    List<PhotoModel>? photosFilenames,
    List<PriceModel>? prices,
    String? status,
    String? title,
    String? uri,
    double? usdPrice,
    String? userSeller,
  }) {
    return ProductItemModel(
      category: category ?? this.category,
      city: city ?? this.city,
      countViews: countViews ?? this.countViews,
      created: created ?? this.created,
      description: description ?? this.description,
      id: id ?? this.id,
      photosFilenames: photosFilenames ?? this.photosFilenames,
      prices: prices ?? this.prices,
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

ProductItemModel _$ProductItemModelFromJson(Map<String, dynamic> json) {
  return ProductItemModel(
    id: json['id'] as String? ?? '',
    title: json['title'] as String? ?? '',
    uri: json['uri'] as String? ?? '',
    description: json['description'] as String? ?? '',
    category: json['category'] as String? ?? '',
    userSeller: json['user_seller'] as String? ?? '',
    status: json['status'] as String? ?? '',
    countViews: json['count_views'] as int? ?? 0,
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
    city: json['city'] == null
        ? null
        : CityModel.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductItemModelToJson(ProductItemModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'uri': instance.uri,
    'description': instance.description,
    'category': instance.category,
    'user_seller': instance.userSeller,
    'status': instance.status,
    'count_views': instance.countViews,
    'usd_price': instance.usdPrice,
    'prices': instance.prices.map((e) => e.toJson()).toList(),
    'photos_filenames':
        instance.photosFilenames.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created', instance.created?.toIso8601String());
  writeNotNull('city', instance.city?.toJson());
  return val;
}
