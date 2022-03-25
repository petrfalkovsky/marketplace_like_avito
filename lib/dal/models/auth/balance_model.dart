import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class BalanceModel {
  @JsonKey(defaultValue: 0)
  final double antares;

  BalanceModel({
    required this.antares,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceModelToJson(this);
}
