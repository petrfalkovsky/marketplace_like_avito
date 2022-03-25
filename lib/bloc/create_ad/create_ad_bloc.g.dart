// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CreateAdStateCopyWith on CreateAdState {
  CreateAdState copyWith({
    PricesToCreateAdModel? andPriceData,
    double? btcFee,
    PricesToCreateAdModel? btcPriceData,
    List<ItemCategoryModel>? categories,
    ItemCategoryModel? category,
    String? categoryError,
    CityAssetModel? city,
    String? cityError,
    List<CityAssetModel>? cityList,
    String? descriptionAd,
    String? descriptionAdError,
    String? error,
    double? getBtc,
    double? getUsd,
    String? phone,
    String? phoneError,
    Map<String, dynamic>? properties,
    double? safeTransactionBtcFee,
    CreateAdStatus? status,
    ItemCategoryModel? subCategory,
    String? subCategoryError,
    CreateAdSwitcher? switcher,
    String? titleAd,
    String? titleAdError,
    List<UploadedPhotoDataModel>? uploadedPhotos,
    int? uploadedPhotosCount,
    String? usdPrice,
  }) {
    return CreateAdState(
      andPriceData: andPriceData ?? this.andPriceData,
      btcFee: btcFee ?? this.btcFee,
      btcPriceData: btcPriceData ?? this.btcPriceData,
      categories: categories ?? this.categories,
      category: category ?? this.category,
      categoryError: categoryError ?? this.categoryError,
      city: city ?? this.city,
      cityError: cityError ?? this.cityError,
      cityList: cityList ?? this.cityList,
      descriptionAd: descriptionAd ?? this.descriptionAd,
      descriptionAdError: descriptionAdError ?? this.descriptionAdError,
      error: error ?? this.error,
      getBtc: getBtc ?? this.getBtc,
      getUsd: getUsd ?? this.getUsd,
      phone: phone ?? this.phone,
      phoneError: phoneError ?? this.phoneError,
      properties: properties ?? this.properties,
      safeTransactionBtcFee:
          safeTransactionBtcFee ?? this.safeTransactionBtcFee,
      status: status ?? this.status,
      subCategory: subCategory ?? this.subCategory,
      subCategoryError: subCategoryError ?? this.subCategoryError,
      switcher: switcher ?? this.switcher,
      titleAd: titleAd ?? this.titleAd,
      titleAdError: titleAdError ?? this.titleAdError,
      uploadedPhotos: uploadedPhotos ?? this.uploadedPhotos,
      uploadedPhotosCount: uploadedPhotosCount ?? this.uploadedPhotosCount,
      usdPrice: usdPrice ?? this.usdPrice,
    );
  }

  CreateAdState copyWithNull({
    bool andPriceData = false,
    bool btcFee = false,
    bool btcPriceData = false,
    bool categories = false,
    bool category = false,
    bool categoryError = false,
    bool city = false,
    bool cityError = false,
    bool cityList = false,
    bool descriptionAdError = false,
    bool getBtc = false,
    bool getUsd = false,
    bool phone = false,
    bool phoneError = false,
    bool properties = false,
    bool safeTransactionBtcFee = false,
    bool subCategory = false,
    bool subCategoryError = false,
    bool titleAdError = false,
    bool uploadedPhotos = false,
    bool uploadedPhotosCount = false,
    bool usdPrice = false,
  }) {
    return CreateAdState(
      andPriceData: andPriceData == true ? null : this.andPriceData,
      btcFee: btcFee == true ? null : this.btcFee,
      btcPriceData: btcPriceData == true ? null : this.btcPriceData,
      categories: categories == true ? null : this.categories,
      category: category == true ? null : this.category,
      categoryError: categoryError == true ? null : this.categoryError,
      city: city == true ? null : this.city,
      cityError: cityError == true ? null : this.cityError,
      cityList: cityList == true ? null : this.cityList,
      descriptionAd: descriptionAd,
      descriptionAdError:
          descriptionAdError == true ? null : this.descriptionAdError,
      error: error,
      getBtc: getBtc == true ? null : this.getBtc,
      getUsd: getUsd == true ? null : this.getUsd,
      phone: phone == true ? null : this.phone,
      phoneError: phoneError == true ? null : this.phoneError,
      properties: properties == true ? null : this.properties,
      safeTransactionBtcFee:
          safeTransactionBtcFee == true ? null : this.safeTransactionBtcFee,
      status: status,
      subCategory: subCategory == true ? null : this.subCategory,
      subCategoryError: subCategoryError == true ? null : this.subCategoryError,
      switcher: switcher,
      titleAd: titleAd,
      titleAdError: titleAdError == true ? null : this.titleAdError,
      uploadedPhotos: uploadedPhotos == true ? null : this.uploadedPhotos,
      uploadedPhotosCount:
          uploadedPhotosCount == true ? null : this.uploadedPhotosCount,
      usdPrice: usdPrice == true ? null : this.usdPrice,
    );
  }
}
