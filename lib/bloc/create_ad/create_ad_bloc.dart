import 'dart:convert';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

part 'create_ad_bloc.g.dart';
part 'create_ad_event.dart';
part 'create_ad_state.dart';

class CreateAdBloc extends Bloc<CreateAdEvent, CreateAdState> {
  final Dal dal;
  final AppStore appStore;
  static const int _maxUploadPhotos = 5;

  CreateAdBloc({
    required this.dal,
    required this.appStore,
  }) : super(CreateAdState(
          status: CreateAdStatus.normal,
          switcher: CreateAdSwitcher.TextPart,
        ));

  @override
  Stream<CreateAdState> mapEventToState(CreateAdEvent event) async* {
    if (event is CreateAdDataClearedEvent) {
      yield* _mapCreateAdDataClearedEventToState(event);
    } else if (event is CreateAdStartedEvent) {
      yield* _mapCreateAdStartedEventToState(event);
    } else if (event is CreateAdTextPartFilledEvent) {
      yield* _mapCreateAdTextPartFilledEventToState(event);
    } else if (event is CreateAdCategoriesPartFilledEvent) {
      yield* _mapCreateAdCategoriesPartFilledEventToState(event);
    } else if (event is CreateAdPickAndUploadPhotoEvent) {
      yield* _mapCreateAdPickAndUploadPhotoEventToState(event);
    } else if (event is CreateAdPhotoPartFilledEvent) {
      yield* _mapCreateAdPhotoPartFilledEventToState(event);
    } else if (event is CreateAdMoneyPartFilledEvent) {
      yield* _mapCreateAdMoneyPartFilledEventToState(event);
    } else if (event is CreateAdNewAdCreatedEvent) {
      yield* _mapCreateAdNewAdCreatedEventToState(event);
    } else if (event is CreateAdInsertedCityEvent) {
      yield state.copyWith(city: event.city).copyWithNull(cityError: true);
    } else if (event is CreateAdInsertedPhoneEvent) {
      yield state.copyWith(phone: event.phone).copyWithNull(phoneError: true);
    } else if (event is CreateAdInsertedCategoryEvent) {
      if (state.category != event.category) {
        yield state.copyWith(category: event.category).copyWithNull(
              categoryError: true,
              subCategory: true,
              properties: true,
            );
      } else {
        yield state
            .copyWith(category: event.category)
            .copyWithNull(categoryError: true);
      }
    } else if (event is CreateAdInsertedSubCategoryEvent) {
      yield* _mapCreateAdInsertedSubCategoryEventToState(event);
    } else if (event is CreateAdInsertedNewPropertyEvent) {
      yield* _mapCreateAdInsertedNewPropertyEventToState(event);
    } else if (event is CreateAdUSDChangedEvent) {
      yield* _mapCreateAdUSDChangedEventToState(event);
    } else if (event is CreateAdCurrencyChangedEvent) {
      yield* _mapCreateAdCurrencyChangedEventToState(event);
    }
  }

  Stream<CreateAdState> _mapCreateAdStartedEventToState(
    CreateAdStartedEvent event,
  ) async* {
    yield state.copyWith(
      status: CreateAdStatus.normal,
      switcher: CreateAdSwitcher.TextPart,
      city: AppPreferences.userCity,
      phone: AppPreferences.user?.phone,
    );
  }

  Stream<CreateAdState> _mapCreateAdTextPartFilledEventToState(
    CreateAdTextPartFilledEvent event,
  ) async* {
    if (event.titleAd.length < 5 || event.descriptionAd.length < 10) {
      yield state
          .copyWith(
            switcher: CreateAdSwitcher.TextPart,
            titleAd: event.titleAd,
            descriptionAd: event.descriptionAd,
            titleAdError: 'Название объявление слишком короткое',
            descriptionAdError: 'Описание слишком короткое',
          )
          .copyWithNull(
            titleAdError: event.titleAd.length >= 5,
            descriptionAdError: event.descriptionAd.length >= 10,
          );
    } else {
      if (state.categories?.isEmpty ?? true) {
        await AlertManager.showProgress();
        final categoriesEither = await dal.searchService.getCategoryList(
          cancelToken: CancelToken(),
        );
        await AlertManager.hideProgress();
        yield* categoriesEither.fold(
          (failure) async* {
            if (failure is CancelledFailure) return;
            yield state.copyWith(
              status: CreateAdStatus.error,
              error: mapFailureToMessage(failure: failure),
            );
          },
          (cats) async* {
            yield state.copyWith(
              categories: cats,
            );
          },
        );
      }
      if (appStore.allCities.value.isEmpty) {
        AssetReader.loadAsset(
          'assets/translations/location/cities.json',
        ).then((_value) {
          List items = jsonDecode(_value);

          appStore.allCities.push(
            items.map((_item) => CityAssetModel.fromJson(_item)).toList(),
          );
        }).then((_) async* {
          yield state.copyWith(
            cityList: appStore.allCities.value,
          );
        });
      }

      /// В этом else переход на следующий раздел.
      yield state
          .copyWith(
            switcher: CreateAdSwitcher.CategoryPart,
            titleAd: event.titleAd,
            descriptionAd: event.descriptionAd,
            cityList: appStore.allCities.value,
          )
          .copyWithNull(
            titleAdError: true,
            descriptionAdError: true,
            cityError: true,
            phoneError: true,
            categoryError: true,
            subCategoryError: true,
          );
    }
  }

  Stream<CreateAdState> _mapCreateAdCategoriesPartFilledEventToState(
    CreateAdCategoriesPartFilledEvent event,
  ) async* {
    final String? _cityError = state.city == null ? 'Выберите город' : null;
    final String? _phoneError =
        state.phone == null ? 'Введите номер телефона' : null;
    final String? _categoryError =
        state.category == null ? 'Выберите категорию' : null;
    final String? _subCategoryError =
        state.subCategory == null ? 'Выберите подкатегорию' : null;

    yield state.copyWith(
      switcher: (_subCategoryError == null &&
              _categoryError == null &&
              _phoneError == null &&
              _cityError == null)
          ? CreateAdSwitcher.PhotoPart
          : CreateAdSwitcher.CategoryPart,
      cityError: _cityError,
      phoneError: _phoneError,
      categoryError: _categoryError,
      subCategoryError: _subCategoryError,
    );
  }

  Stream<CreateAdState> _mapCreateAdPickAndUploadPhotoEventToState(
    CreateAdPickAndUploadPhotoEvent event,
  ) async* {
    if ((state.uploadedPhotos?.length ?? 0) < _maxUploadPhotos &&
        (state.uploadedPhotosCount ?? 0) < _maxUploadPhotos) {
      XFile? selectedFile = await AlertManager.showPickerDialog();
      if (selectedFile != null && selectedFile is XFile) {
        // AlertManager.showShortToast(
        //   'Работает!!! Пришёл "XFile" (${selectedFile.runtimeType.toString()})',
        // );
        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(
            selectedFile.path,
            filename: selectedFile.name,
            contentType: MediaType('image', 'jpeg'),
          ),
        });

        final uploadSelectedImageEither = await dal.createAdService.uploadImage(
          formData: formData,
          cancelToken: CancelToken(),
        );

        yield* uploadSelectedImageEither.fold(
          (failure) async* {
            AlertManager.showErrorDialog(
              errors: mapFailureToMessageList(failure: failure),
            );
          },
          (response) async* {
            if ((state.uploadedPhotos?.length ?? 0) < _maxUploadPhotos) {
              List<UploadedPhotoDataModel> _uploadedPhotos =
                  state.uploadedPhotos ?? [];
              _uploadedPhotos.add(response);
              yield state.copyWith(
                uploadedPhotos: _uploadedPhotos,
                uploadedPhotosCount: (state.uploadedPhotosCount ?? 0) + 1,
              );
            } else {
              // Перебор, достигнуто максимимальгое количество фото (30 шт).
              AlertManager.showShortToast(
                'Упс, достигнуто максимальное количество фото ($_maxUploadPhotos шт)',
              );
            }
          },
        );
      }
    } else {
      /// Перебор, достигнуто максимимальгое количество фото (30 шт).
      AlertManager.showShortToast(
        'Упсс, достигнуто максимимальгое количество фото ($_maxUploadPhotos шт)',
      );
    }
  }

  Stream<CreateAdState> _mapCreateAdPhotoPartFilledEventToState(
    CreateAdPhotoPartFilledEvent event,
  ) async* {
    yield state.copyWith(
      switcher: state.uploadedPhotos?.isNotEmpty ?? false
          ? CreateAdSwitcher.MoneyPart
          : CreateAdSwitcher.PhotoPart,
    );
  }

  Stream<CreateAdState> _mapCreateAdMoneyPartFilledEventToState(
    CreateAdMoneyPartFilledEvent event,
  ) async* {
    var b = state.properties!;
    List<PropertiesToCreateAdModel> _properties = [];
    state.properties!.forEach((key, value) {
      if (value is List) {
        if (value.isNotEmpty && value[0] is PropertyOptionModel) {
          if (value.length >= 2) {
            _properties.add(PropertiesToCreateAdModel(
              property: key,
              value: value[0].id,
              subValue: value[1].id,
            ));
          } else {
            _properties.add(PropertiesToCreateAdModel(
              property: key,
              value: value[0].id,
            ));
          }
        } else {
          value.forEach((element) {
            _properties.add(PropertiesToCreateAdModel(
              property: key,
              value: element.toString(),
            ));
          });
        }
      } else if (value is double) {
        _properties.add(PropertiesToCreateAdModel(
          property: key,
          value: value == value.toInt()
              ? value.toInt().toString()
              : value.toString(),
        ));
      } else {
        _properties.add(PropertiesToCreateAdModel(
          property: key,
          value: value.toString(),
        ));
      }
    });
    List<String> photosFilenames = [];
    state.uploadedPhotos!.forEach((element) {
      photosFilenames.add(element.filename);
    });
    List<PricesToCreateAdModel> _prices = [];
    if (state.andPriceData?.enabled ?? false) {
      if (state.andPriceData!.address != '') {
        _prices.add(PricesToCreateAdModel(
          address: state.andPriceData!.address,
          amount: '',
          currency: state.andPriceData!.currency,
          enabled: state.andPriceData!.enabled,
        ));
      }
    }
    if (state.btcPriceData?.enabled ?? false) {
      if (state.btcPriceData!.address != '') {
        _prices.add(PricesToCreateAdModel(
          address: state.btcPriceData!.address,
          amount: '',
          currency: state.btcPriceData!.currency,
          enabled: state.btcPriceData!.enabled,
        ));
      }
    }
    print(b);
    final createAdRequestEither = await dal.createAdService.createAdRequest(
      title: state.titleAd,
      description: state.descriptionAd,
      subCategoryId: state.subCategory!.id,
      cityId: state.city!.id,
      phone: state.phone!,
      usdPrice: state.usdPrice!,
      properties: _properties,
      prices: _prices,
      photosFilenames: photosFilenames,
      cancelToken: CancelToken(),
    );
    yield* createAdRequestEither.fold(
      (failure) async* {
        AlertManager.showErrorDialog(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (result) async* {
        yield CreateAdState(
          status: CreateAdStatus.normal,
          switcher: CreateAdSwitcher.CreatedAdPart,
          cityList: state.cityList,
          categories: state.categories,
        );
      },
    );
  }

  Stream<CreateAdState> _mapCreateAdNewAdCreatedEventToState(
    CreateAdNewAdCreatedEvent event,
  ) async* {
    yield* _mapCreateAdDataClearedEventToState(CreateAdDataClearedEvent());
  }

  Stream<CreateAdState> _mapCreateAdDataClearedEventToState(
    CreateAdDataClearedEvent event,
  ) async* {
    yield CreateAdState(
      status: CreateAdStatus.normal,
      switcher: CreateAdSwitcher.TextPart,
      cityList: state.cityList,
      categories: state.categories,
    );
    yield* _mapCreateAdStartedEventToState(CreateAdStartedEvent());
  }

  Stream<CreateAdState> _mapCreateAdInsertedSubCategoryEventToState(
    CreateAdInsertedSubCategoryEvent event,
  ) async* {
    Map<String, dynamic> userSelectedProperties = {};
    event.subCategory.properties.forEach((property) {
      switch (property.type) {
        case 'list':
          if (property.rules?.multiple ?? false) {
            userSelectedProperties[property.id] = [];
          } else {
            userSelectedProperties[property.id] = property.listOptions[0].id;
          }
          return;

        case 'number':
          try {
            userSelectedProperties[property.id] = property.rules?.float ?? false
                ? property.rules!.min
                : property.rules!.min.toInt();
          } catch (e) {}

          return;

        case 'select':
          try {
            userSelectedProperties[property.id] = <PropertyOptionModel>[];
          } catch (e) {}

          return;

        case 'string':
          userSelectedProperties[property.id] = '';

          return;
        default:
          return;
      }
    });

    yield state
        .copyWith(
          subCategory: event.subCategory,
          properties: userSelectedProperties,
        )
        .copyWithNull(subCategoryError: true);
  }

  Stream<CreateAdState> _mapCreateAdInsertedNewPropertyEventToState(
    CreateAdInsertedNewPropertyEvent event,
  ) async* {
    Map<String, dynamic> selectedProps = state.properties!;
    switch (event.type) {
      case 'list':
        if (selectedProps[event.id] is List) {
          (selectedProps[event.id] as List).contains(event.value)
              ? (selectedProps[event.id] as List).remove(event.value)
              : (selectedProps[event.id] as List).add(event.value);
        } else {
          selectedProps[event.id] = event.value;
        }
        break;

      case 'bool':
        if (selectedProps.containsKey(event.id)) {
          selectedProps.remove(event.id);
        } else {
          selectedProps[event.id] = event.value;
        }
        break;

      case 'select':
        if (event.value != null) {
          if ((selectedProps[event.id] as List<PropertyOptionModel>).length >=
              1) {
            if (selectedProps[event.id][0] != event.value &&
                (selectedProps[event.id] as List<PropertyOptionModel>)
                    .asMap()
                    .containsKey(1)) {
              (selectedProps[event.id] as List<PropertyOptionModel>)
                  .removeAt(1);
            }

            selectedProps[event.id][0] = event.value;
          } else {
            (selectedProps[event.id] as List<PropertyOptionModel>)
                .add(event.value);
          }
        }
        if (event.subOptions != null &&
            (selectedProps[event.id] as List<PropertyOptionModel>).isNotEmpty) {
          (selectedProps[event.id] as List<PropertyOptionModel>).length >= 2
              ? selectedProps[event.id][1] =
                  event.subOptions as PropertyOptionModel
              : (selectedProps[event.id] as List<PropertyOptionModel>)
                  .add(event.subOptions as PropertyOptionModel);
        }
        break;

      case 'number':
      case 'string':
      default:
        selectedProps[event.id] = event.value;
        break;
    }

    yield state.copyWith(
      properties: selectedProps,
    );
  }

  Stream<CreateAdState> _mapCreateAdUSDChangedEventToState(
    CreateAdUSDChangedEvent event,
  ) async* {
    final double _usdPrice = double.tryParse(event.usdPrice) ?? 0;

    final double usdPriceAND = 1;
    final double usdPriceBTC = 61008.7699302828;
    final double safeTransactionFeePercent = 0.01;
    final double btcFee = 0.001;

    final double safeTransactionBtcFee =
        (_usdPrice / usdPriceBTC) * safeTransactionFeePercent;
    final double getBtc = (_usdPrice / usdPriceBTC) -
        (_usdPrice / usdPriceBTC * safeTransactionFeePercent) -
        btcFee;
    final double getUsd = getBtc * usdPriceBTC;

    PricesToCreateAdModel _andPriceData = PricesToCreateAdModel(
      currency: 'AND',
      address: state.andPriceData?.address ?? '',
      amount: (_usdPrice / usdPriceAND) == (_usdPrice / usdPriceAND).truncate()
          ? (_usdPrice / usdPriceAND).truncate().toString()
          : (_usdPrice / usdPriceAND).toString(),
      enabled: state.andPriceData?.enabled ?? false,
    );
    PricesToCreateAdModel _btcPriceData = PricesToCreateAdModel(
      currency: 'BTC',
      address: state.btcPriceData?.address ?? '',
      amount: (_usdPrice / usdPriceBTC).toStringAsFixed(8),
      enabled: state.btcPriceData?.enabled ?? false,
    );

    yield state.copyWith(
      usdPrice: event.usdPrice,
      andPriceData: _andPriceData,
      btcPriceData: _btcPriceData,
      btcFee: btcFee,
      safeTransactionBtcFee: safeTransactionBtcFee,
      getBtc: getBtc,
      getUsd: getUsd,
    );
  }

  Stream<CreateAdState> _mapCreateAdCurrencyChangedEventToState(
    CreateAdCurrencyChangedEvent event,
  ) async* {
    if (event.currency == 'AND') {
      PricesToCreateAdModel _andPriceData = PricesToCreateAdModel(
        currency: 'AND',
        address: event.addressCurrency ?? state.andPriceData?.address ?? '',
        amount: state.andPriceData?.amount ?? '',
        enabled: event.enabled ?? state.andPriceData?.enabled ?? false,
      );
      yield state.copyWith(andPriceData: _andPriceData);
    }
    if (event.currency == 'BTC') {
      PricesToCreateAdModel _btcPriceData = PricesToCreateAdModel(
        currency: 'BTC',
        address: event.addressCurrency ?? state.btcPriceData?.address ?? '',
        amount: state.btcPriceData?.amount ?? '',
        enabled: event.enabled ?? state.btcPriceData?.enabled ?? false,
      );
      yield state.copyWith(btcPriceData: _btcPriceData);
    }
  }
}
