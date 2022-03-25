part of 'create_ad_bloc.dart';

abstract class CreateAdEvent extends Equatable {
  const CreateAdEvent();
}

class CreateAdDataClearedEvent extends CreateAdEvent {
  @override
  List<Object?> get props => [];
}

class CreateAdStartedEvent extends CreateAdEvent {
  @override
  List<Object?> get props => [];
}

class CreateAdTextPartFilledEvent extends CreateAdEvent {
  final String titleAd;
  final String descriptionAd;
  CreateAdTextPartFilledEvent({
    required this.titleAd,
    required this.descriptionAd,
  });
  @override
  List<Object?> get props => [
        titleAd,
        descriptionAd,
      ];
}

class CreateAdCategoriesPartFilledEvent extends CreateAdEvent {
  final String? cityId;
  final String? phone;
  final String? categoryId;
  CreateAdCategoriesPartFilledEvent({
    this.cityId,
    this.phone,
    this.categoryId,
  });
  @override
  List<Object?> get props => [];
}

class CreateAdPickAndUploadPhotoEvent extends CreateAdEvent {
  @override
  List<Object?> get props => [];
}

class CreateAdPhotoPartFilledEvent extends CreateAdEvent {
  @override
  List<Object?> get props => [];
}

class CreateAdMoneyPartFilledEvent extends CreateAdEvent {
  final String btcAddress;

  CreateAdMoneyPartFilledEvent({
    required this.btcAddress,
  });
  @override
  List<Object?> get props => [
        btcAddress,
      ];
}

class CreateAdNewAdCreatedEvent extends CreateAdEvent {
  @override
  List<Object?> get props => [];
}

class CreateAdInsertedCityEvent extends CreateAdEvent {
  final CityAssetModel city;

  CreateAdInsertedCityEvent({
    required this.city,
  });

  @override
  List<Object?> get props => [
        city,
      ];
}

class CreateAdInsertedPhoneEvent extends CreateAdEvent {
  final String phone;

  CreateAdInsertedPhoneEvent({
    required this.phone,
  });

  @override
  List<Object?> get props => [
        phone,
      ];
}

class CreateAdInsertedCategoryEvent extends CreateAdEvent {
  final ItemCategoryModel category;

  CreateAdInsertedCategoryEvent({
    required this.category,
  });

  @override
  List<Object?> get props => [
        category,
      ];
}

class CreateAdInsertedSubCategoryEvent extends CreateAdEvent {
  final ItemCategoryModel subCategory;

  CreateAdInsertedSubCategoryEvent({
    required this.subCategory,
  });

  @override
  List<Object?> get props => [
        subCategory,
      ];
}

class CreateAdInsertedNewPropertyEvent extends CreateAdEvent {
  final String id;
  final String type;
  final dynamic value;
  final PropertyOptionModel? subOptions;

  CreateAdInsertedNewPropertyEvent({
    required this.id,
    required this.type,
    required this.value,
    this.subOptions,
  });
  @override
  List<Object?> get props => [
        id,
        type,
        value,
        subOptions,
      ];
}

class CreateAdUSDChangedEvent extends CreateAdEvent {
  final String usdPrice;

  CreateAdUSDChangedEvent({
    required this.usdPrice,
  });
  @override
  List<Object?> get props => [
        usdPrice,
      ];
}

class CreateAdCurrencyChangedEvent extends CreateAdEvent {
  final String currency;
  final String? addressCurrency;
  final bool? enabled;

  CreateAdCurrencyChangedEvent({
    required this.currency,
    this.addressCurrency,
    this.enabled,
  });
  @override
  List<Object?> get props => [
        currency,
        addressCurrency,
        enabled,
      ];
}

class CreateAdDeletedPropertyEvent extends CreateAdEvent {
  final String id;

  CreateAdDeletedPropertyEvent({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}
