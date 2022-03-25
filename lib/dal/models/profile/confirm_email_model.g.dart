// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_email_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ConfirmEmailModelCopyWith on ConfirmEmailModel {
  ConfirmEmailModel copyWith({
    DateTime? createDate,
    EmailSentModel? emailsSent,
    bool? isConfirmed,
  }) {
    return ConfirmEmailModel(
      createDate: createDate ?? this.createDate,
      emailsSent: emailsSent ?? this.emailsSent,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmEmailModel _$ConfirmEmailModelFromJson(Map<String, dynamic> json) {
  return ConfirmEmailModel(
    createDate: json['create_date'] == null
        ? null
        : DateTime.parse(json['create_date'] as String),
    emailsSent: json['emails_sent'] == null
        ? null
        : EmailSentModel.fromJson(json['emails_sent'] as Map<String, dynamic>),
    isConfirmed: json['is_confirmed'] as bool? ?? false,
  );
}

Map<String, dynamic> _$ConfirmEmailModelToJson(ConfirmEmailModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create_date', instance.createDate?.toIso8601String());
  writeNotNull('emails_sent', instance.emailsSent?.toJson());
  val['is_confirmed'] = instance.isConfirmed;
  return val;
}
