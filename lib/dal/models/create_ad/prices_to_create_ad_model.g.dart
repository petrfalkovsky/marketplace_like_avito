// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_to_create_ad_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension PricesToCreateAdModelCopyWith on PricesToCreateAdModel {
  PricesToCreateAdModel copyWith({
    String? address,
    String? amount,
    String? currency,
    bool? enabled,
  }) {
    return PricesToCreateAdModel(
      address: address ?? this.address,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      enabled: enabled ?? this.enabled,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesToCreateAdModel _$PricesToCreateAdModelFromJson(
    Map<String, dynamic> json) {
  return PricesToCreateAdModel(
    currency: json['currency'] as String? ?? '',
    address: json['address'] as String? ?? '',
    amount: json['amount'] as String? ?? '',
    enabled: json['enabled'] as bool? ?? false,
  );
}

Map<String, dynamic> _$PricesToCreateAdModelToJson(
        PricesToCreateAdModel instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'amount': instance.amount,
      'address': instance.address,
      'enabled': instance.enabled,
    };
