// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_item_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension FavoriteItemModelCopyWith on FavoriteItemModel {
  FavoriteItemModel copyWith({
    String? category,
    String? city,
    int? countViews,
    DateTime? created,
    String? description,
    String? id,
    List<String>? photosFilenames,
    List<PriceModel>? prices,
    String? status,
    String? title,
    String? uri,
    double? usdPrice,
    String? userSeller,
  }) {
    return FavoriteItemModel(
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

FavoriteItemModel _$FavoriteItemModelFromJson(Map<String, dynamic> json) {
  return FavoriteItemModel(
    id: json['_id'] as String? ?? '',
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
            ?.map((e) => e as String)
            .toList() ??
        [],
    created: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$FavoriteItemModelToJson(FavoriteItemModel instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'title': instance.title,
    'uri': instance.uri,
    'description': instance.description,
    'category': instance.category,
    'user_seller': instance.userSeller,
    'status': instance.status,
    'count_views': instance.countViews,
    'usd_price': instance.usdPrice,
    'prices': instance.prices.map((e) => e.toJson()).toList(),
    'photos_filenames': instance.photosFilenames,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.created?.toIso8601String());
  writeNotNull('city', instance.city);
  return val;
}
