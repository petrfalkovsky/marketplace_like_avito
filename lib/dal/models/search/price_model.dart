import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class PriceModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String currency;
  @JsonKey(defaultValue: '')
  final String address;
  @JsonKey(defaultValue: '')
  final String amount;

  PriceModel({
    required this.id,
    required this.currency,
    required this.address,
    required this.amount,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}
