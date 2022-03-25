// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_new_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CountNewModelCopyWith on CountNewModel {
  CountNewModel copyWith({
    List<dynamic>? chats,
    List<dynamic>? orders,
  }) {
    return CountNewModel(
      chats: chats ?? this.chats,
      orders: orders ?? this.orders,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountNewModel _$CountNewModelFromJson(Map<String, dynamic> json) {
  return CountNewModel(
    orders: json['orders'] as List<dynamic>? ?? [],
    chats: json['chats'] as List<dynamic>? ?? [],
  );
}

Map<String, dynamic> _$CountNewModelToJson(CountNewModel instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'chats': instance.chats,
    };
