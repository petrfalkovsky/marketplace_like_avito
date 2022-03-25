import 'package:antares_market/dal/models/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_filter_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
@CopyWith(generateCopyWithNull: true)
class SearchFilterModel {
  final CountryAssetModel? country;
  final CityAssetModel? city;
  final double? priceFrom;
  final double? priceTo;
  final String? sort;
  final String? sortDestination;

  @JsonKey(ignore: true)
  SearchFilterSort get sortSummary {
    if (sortDestination == 'desc') {
      if (sort == 'date') return SearchFilterSort.dateDesc;
      if (sort == 'price') return SearchFilterSort.priceDesc;
    } else if (sortDestination == 'asc') {
      if (sort == 'date') return SearchFilterSort.dateAsc;
      if (sort == 'price') return SearchFilterSort.priceAsc;
    }
    return SearchFilterSort.dateDesc;
  }

  SearchFilterModel({
    this.country,
    this.city,
    this.priceFrom,
    this.priceTo,
    this.sort,
    this.sortDestination,
  });

  factory SearchFilterModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchFilterModelToJson(this);
}

enum SearchFilterSort {
  dateDesc,
  dateAsc,
  priceAsc,
  priceDesc,
}
