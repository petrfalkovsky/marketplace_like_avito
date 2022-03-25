// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension PriceModelCopyWith on PriceModel {
  PriceModel copyWith({
    String? address,
    String? amount,
    String? currency,
    String? id,
  }) {
    return PriceModel(
      address: address ?? this.address,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      id: id ?? this.id,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) {
  return PriceModel(
    id: json['id'] as String? ?? '',
    currency: json['currency'] as String? ?? '',
    address: json['address'] as String? ?? '',
    amount: json['amount'] as String? ?? '',
  );
}

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'address': instance.address,
      'amount': instance.amount,
    };
