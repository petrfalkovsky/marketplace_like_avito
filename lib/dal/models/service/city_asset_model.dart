import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_asset_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith()
class CityAssetModel {
  @JsonKey(defaultValue: '', name: '_id')
  String id;
  @JsonKey(defaultValue: '')
  String en;
  @JsonKey(defaultValue: '')
  String ru;
  @JsonKey(defaultValue: '')
  String country;

  CityAssetModel({
    required this.id,
    required this.en,
    required this.ru,
    required this.country,
  });

  factory CityAssetModel.fromJson(Map<String, dynamic> json) =>
      _$CityAssetModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityAssetModelToJson(this);

  String localizedName(String langCode) {
    final isRuLocale = langCode == 'ru';
    return isRuLocale ? ru : en;
  }
}
