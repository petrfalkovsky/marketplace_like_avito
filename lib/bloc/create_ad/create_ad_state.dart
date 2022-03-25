part of 'create_ad_bloc.dart';

enum CreateAdStatus {
  loading,
  error,
  normal,
}

enum CreateAdSwitcher {
  TextPart,
  CategoryPart,
  PhotoPart,
  MoneyPart,
  CreatedAdPart,
}

@CopyWith(generateCopyWithNull: true)
class CreateAdState extends Equatable {
  final CreateAdStatus status;
  final CreateAdSwitcher switcher;
  final String error;

  final String titleAd;
  final String? titleAdError;
  final String descriptionAd;
  final String? descriptionAdError;

  final List<CityAssetModel>? cityList;
  final CityAssetModel? city;
  final String? cityError;
  final String? phone;
  final String? phoneError;
  final List<ItemCategoryModel>? categories;
  final ItemCategoryModel? category;
  final String? categoryError;
  final ItemCategoryModel? subCategory;
  final String? subCategoryError;
  final Map<String, dynamic>? properties;

  final List<UploadedPhotoDataModel>? uploadedPhotos;
  final int? uploadedPhotosCount;

  final String? usdPrice;
  final double? btcFee;
  final double? safeTransactionBtcFee;
  final double? getBtc;
  final double? getUsd;
  final PricesToCreateAdModel? andPriceData;
  final PricesToCreateAdModel? btcPriceData;

  const CreateAdState({
    required this.status,
    required this.switcher,
    this.error = '',
    //
    this.titleAd = '',
    this.titleAdError,
    this.descriptionAd = '',
    this.descriptionAdError,
    //
    this.cityList,
    this.city,
    this.cityError,
    this.phone,
    this.phoneError,
    this.categories,
    this.category,
    this.categoryError,
    this.subCategory,
    this.subCategoryError,
    this.properties,
    //
    this.uploadedPhotos,
    this.uploadedPhotosCount,
    //
    this.usdPrice,
    this.btcFee,
    this.getBtc,
    this.getUsd,
    this.safeTransactionBtcFee,
    this.andPriceData,
    this.btcPriceData,
  });
  @override
  List<Object?> get props => [
        status,
        switcher,
        error,
        //
        titleAd,
        titleAdError,
        descriptionAd,
        descriptionAdError,
        //
        cityList,
        city,
        cityError,
        phone,
        phoneError,
        categories,
        category,
        categoryError,
        subCategory,
        subCategoryError,
        properties,
        //
        uploadedPhotos,
        uploadedPhotosCount,
        //
        usdPrice,
        btcFee,
        safeTransactionBtcFee,
        getBtc,
        getUsd,
        andPriceData,
        btcPriceData,
      ];
}
