// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrer_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ReferrerModelCopyWith on ReferrerModel {
  ReferrerModel copyWith({
    String? invitedBy,
    String? referralCode,
    dynamic? walletAddress,
  }) {
    return ReferrerModel(
      invitedBy: invitedBy ?? this.invitedBy,
      referralCode: referralCode ?? this.referralCode,
      walletAddress: walletAddress ?? this.walletAddress,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferrerModel _$ReferrerModelFromJson(Map<String, dynamic> json) {
  return ReferrerModel(
    referralCode: json['referral_code'] as String? ?? '',
    invitedBy: json['invited_by'] as String? ?? '',
    walletAddress: json['wallet_address'],
  );
}

Map<String, dynamic> _$ReferrerModelToJson(ReferrerModel instance) {
  final val = <String, dynamic>{
    'referral_code': instance.referralCode,
    'invited_by': instance.invitedBy,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('wallet_address', instance.walletAddress);
  return val;
}
