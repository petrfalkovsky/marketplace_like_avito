// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_sent_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension EmailSentModelCopyWith on EmailSentModel {
  EmailSentModel copyWith({
    int? count,
    DateTime? lastSent,
  }) {
    return EmailSentModel(
      count: count ?? this.count,
      lastSent: lastSent ?? this.lastSent,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailSentModel _$EmailSentModelFromJson(Map<String, dynamic> json) {
  return EmailSentModel(
    count: json['count'] as int? ?? 0,
    lastSent: json['last_sent'] == null
        ? null
        : DateTime.parse(json['last_sent'] as String),
  );
}

Map<String, dynamic> _$EmailSentModelToJson(EmailSentModel instance) {
  final val = <String, dynamic>{
    'count': instance.count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_sent', instance.lastSent?.toIso8601String());
  return val;
}
