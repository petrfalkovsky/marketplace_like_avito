import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_order_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class ItemOrderModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String product;
  @JsonKey(defaultValue: '')
  final String status;
  @JsonKey(defaultValue: '')
  final String userBuyer;
  @JsonKey(defaultValue: '')
  final String userSeller;
  @JsonKey(defaultValue: [])
  final List<dynamic> paymentMethods;
  final DateTime? created;

  ItemOrderModel({
    required this.id,
    required this.product,
    required this.status,
    required this.userBuyer,
    required this.userSeller,
    required this.paymentMethods,
    required this.created,
  });

  factory ItemOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ItemOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemOrderModelToJson(this);
}
