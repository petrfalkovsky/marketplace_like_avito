// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mailing_rules_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension MailingRulesModelCopyWith on MailingRulesModel {
  MailingRulesModel copyWith({
    int? messages,
    int? news,
    int? products,
    int? reviews,
  }) {
    return MailingRulesModel(
      messages: messages ?? this.messages,
      news: news ?? this.news,
      products: products ?? this.products,
      reviews: reviews ?? this.reviews,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MailingRulesModel _$MailingRulesModelFromJson(Map<String, dynamic> json) {
  return MailingRulesModel(
    messages: json['messages'] as int? ?? 0,
    reviews: json['reviews'] as int? ?? 0,
    news: json['news'] as int? ?? 0,
    products: json['products'] as int? ?? 0,
  );
}

Map<String, dynamic> _$MailingRulesModelToJson(MailingRulesModel instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'reviews': instance.reviews,
      'news': instance.news,
      'products': instance.products,
    };
