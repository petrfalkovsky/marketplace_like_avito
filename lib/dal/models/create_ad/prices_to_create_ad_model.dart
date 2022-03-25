import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prices_to_create_ad_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class PricesToCreateAdModel {
  @JsonKey(defaultValue: '')
  final String currency;
  @JsonKey(defaultValue: '')
  final String amount;
  @JsonKey(defaultValue: '')
  final String address;
  @JsonKey(defaultValue: false)
  final bool enabled;

  PricesToCreateAdModel({
    required this.currency,
    required this.address,
    required this.amount,
    required this.enabled,
  });

  factory PricesToCreateAdModel.fromJson(Map<String, dynamic> json) =>
      _$PricesToCreateAdModelFromJson(json);
  Map<String, dynamic> toJson() => _$PricesToCreateAdModelToJson(this);
}
