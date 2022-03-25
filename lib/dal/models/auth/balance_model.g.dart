// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension BalanceModelCopyWith on BalanceModel {
  BalanceModel copyWith({
    double? antares,
  }) {
    return BalanceModel(
      antares: antares ?? this.antares,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) {
  return BalanceModel(
    antares: (json['antares'] as num?)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'antares': instance.antares,
    };
