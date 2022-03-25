import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_asset_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class CountryAssetModel {
  @JsonKey(defaultValue: '')
  String id;
  @JsonKey(defaultValue: '')
  String en;
  @JsonKey(defaultValue: '')
  String ru;

  CountryAssetModel({
    required this.id,
    required this.en,
    required this.ru,
  });

  factory CountryAssetModel.fromJson(Map<String, dynamic> json) =>
      _$CountryAssetModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryAssetModelToJson(this);

  String localizedName(String langCode) {
    final isRuLocale = langCode == 'ru';
    return isRuLocale ? ru : en;
  }
}
