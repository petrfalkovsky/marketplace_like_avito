// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_order_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ItemOrderModelCopyWith on ItemOrderModel {
  ItemOrderModel copyWith({
    DateTime? created,
    String? id,
    List<dynamic>? paymentMethods,
    String? product,
    String? status,
    String? userBuyer,
    String? userSeller,
  }) {
    return ItemOrderModel(
      created: created ?? this.created,
      id: id ?? this.id,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      product: product ?? this.product,
      status: status ?? this.status,
      userBuyer: userBuyer ?? this.userBuyer,
      userSeller: userSeller ?? this.userSeller,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOrderModel _$ItemOrderModelFromJson(Map<String, dynamic> json) {
  return ItemOrderModel(
    id: json['id'] as String? ?? '',
    product: json['product'] as String? ?? '',
    status: json['status'] as String? ?? '',
    userBuyer: json['user_buyer'] as String? ?? '',
    userSeller: json['user_seller'] as String? ?? '',
    paymentMethods: json['payment_methods'] as List<dynamic>? ?? [],
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
  );
}

Map<String, dynamic> _$ItemOrderModelToJson(ItemOrderModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'product': instance.product,
    'status': instance.status,
    'user_buyer': instance.userBuyer,
    'user_seller': instance.userSeller,
    'payment_methods': instance.paymentMethods,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created', instance.created?.toIso8601String());
  return val;
}
