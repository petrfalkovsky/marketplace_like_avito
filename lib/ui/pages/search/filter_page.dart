import 'dart:convert';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/core/services/app_preferences.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/injection_container.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({
    Key? key,
  }) : super(key: key);

  @override
  _SearchFilterPageState createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage>
    with StateUtilsMixin {
  final _priceFromController = TextEditingController();
  final _priceToController = TextEditingController();

  late AppStore _appStore;
  late MessageBus _messageBus;
  late SearchFilterModel _filter;
  List<CityAssetModel> _lastCities = [];
  String? _lastCountry;

  @override
  void didInitDependencies() {
    super.didInitDependencies();
    _appStore = getIt();
    _messageBus = getIt();
    _filter = _appStore.searchFilter.value ?? SearchFilterModel();
    _priceFromController.text = _filter.priceFrom?.toString() ?? '';
    _priceToController.text = _filter.priceTo?.toString() ?? '';
  }

  @override
  void dispose() {
    _priceFromController.dispose();
    _priceToController.dispose();
    super.dispose();
  }

  Future _selectCountries() async {
    if (_appStore.allCountries.value.isEmpty) {
      await AlertManager.showProgress();
      final value = await AssetReader.loadAsset(
        'assets/translations/location/countries.json',
      );
      List items = jsonDecode(value);
      _appStore.allCountries.push(
        items.map((item) => CountryAssetModel.fromJson(item)).toList(),
      );
      await AlertManager.hideProgress();
    }
    final langCode = context.locale.languageCode;
    Get.toNamed(
      AppRoutes.SERVICE_LIST_SELECTOR,
      arguments: {
        'list': _appStore.allCountries.value,
        'getName': (item) {
          if (item is CountryAssetModel) {
            return item.localizedName(langCode);
          }
          return '';
        },
        'onSelected': (item) {
          if (item is CountryAssetModel) {
            setState(() {
              _filter =
                  _filter.copyWith(country: item).copyWithNull(city: true);
            });
          }
        },
      },
    );
  }

  Future _selectCities() async {
    if (_appStore.allCities.value.isEmpty ||
        _lastCountry != _filter.country?.id) {
      await AlertManager.showProgress();

      if (_appStore.allCities.value.isEmpty) {
        final value = await AssetReader.loadAsset(
          'assets/translations/location/cities.json',
        );
        List items = jsonDecode(value);
        _appStore.allCities.push(
          items.map((item) => CityAssetModel.fromJson(item)).toList(),
        );
      }

      if (_lastCountry != _filter.country?.id) {
        _lastCountry = _filter.country?.id;
        _lastCities = _appStore.allCities.value
            .where((city) => city.country == _filter.country?.id)
            .toList();
      }

      await AlertManager.hideProgress();
    }

    final langCode = context.locale.languageCode;

    Get.toNamed(
      AppRoutes.SERVICE_LIST_SELECTOR,
      arguments: {
        'list': _lastCities,
        'getName': (item) {
          if (item is CityAssetModel) {
            return item.localizedName(langCode);
          }
          return '';
        },
        'onSelected': (item) {
          if (item is CityAssetModel) {
            setState(() {
              _filter = _filter.copyWith(
                city: item,
              );
            });
          }
        },
      },
    );
  }

  void _selectSort(SearchFilterSort sort) {
    switch (sort) {
      case SearchFilterSort.dateDesc:
        _filter = _filter.copyWith(sort: 'date', sortDestination: 'desc');
        break;
      case SearchFilterSort.dateAsc:
        _filter = _filter.copyWith(sort: 'date', sortDestination: 'asc');
        break;
      case SearchFilterSort.priceAsc:
        _filter = _filter.copyWith(sort: 'price', sortDestination: 'asc');
        break;
      case SearchFilterSort.priceDesc:
        _filter = _filter.copyWith(sort: 'price', sortDestination: 'desc');
        break;
    }
    setState(() {});
  }

  void _save() async {
    final priceFrom = double.tryParse(_priceFromController.text);
    final priceTo = double.tryParse(_priceToController.text);
    await AppPreferences.setUserCity(_filter.city);
    await AppPreferences.setUserCountry(_filter.country);
    _appStore.searchFilter.push(_filter
        .copyWith(
          priceFrom: priceFrom,
          priceTo: priceTo,
        )
        .copyWithNull(
          priceFrom: priceFrom == null,
          priceTo: priceTo == null,
        ));

    Get.back();
    _messageBus.send(SearchFilterUpdatedEvent());
  }

  //////
  /// UI
  //////
  @override
  Widget build(BuildContext context) {
    final langCode = context.locale.languageCode;
    final countrySelected = _filter.country != null;
    final citySelected = _filter.city != null;

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: Offset(0, 2),
                color: Color.fromARGB(25, 0, 146, 169),
              ),
            ],
            color: Colors.white,
          ),
          child: AppBar(
            centerTitle: true,
            title: Text('Уточнить').tr(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            elevation: 0,
          ),
        ),
      ),
      body: FillBodyWidget(
        scrollPadding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Страна'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: grey2Color,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SelectionWidget(
                      onTap: _selectCountries,
                      child: Row(
                        children: [
                          SizedBox(width: 14),
                          Text(
                            countrySelected
                                ? _filter.country!.localizedName(langCode)
                                : 'Выберите страну'.tr(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: countrySelected ? grey2Color : grey3Color,
                            ),
                          ).expanded(),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: nonActiveColor,
                          ),
                          SizedBox(width: 14),
                        ],
                      ),
                    ),
                  ),
                ).expanded(),
                if (countrySelected)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _filter = _filter.copyWithNull(
                          country: true,
                          city: true,
                        );
                      });
                    },
                    icon: Icon(Icons.close),
                    color: heartColor,
                  ),
              ],
            ),
            if (countrySelected) ...[
              SizedBox(height: 12),
              Text(
                'Город'.tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: grey2Color,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SelectionWidget(
                        onTap: _selectCities,
                        child: Row(
                          children: [
                            SizedBox(width: 14),
                            Text(
                              citySelected
                                  ? _filter.city!.localizedName(langCode)
                                  : 'Выберите город'.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: citySelected ? grey2Color : grey3Color,
                              ),
                            ).expanded(),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                              color: nonActiveColor,
                            ),
                            SizedBox(width: 14),
                          ],
                        ),
                      ),
                    ),
                  ).expanded(),
                  if (citySelected)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _filter = _filter.copyWithNull(city: true);
                        });
                      },
                      icon: Icon(Icons.close),
                      color: heartColor,
                    ),
                ],
              ),
            ],
            SizedBox(height: 12),
            Text(
              'Цена'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: grey2Color,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: TextField(
                    controller: _priceFromController,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      ReplaceInputFormatter(from: ',', replace: '.'),
                      LeadingZeroWithDotInputFormatter(),
                      ValidatorInputFormatter(
                        editingValidator: DecimalNumberEditingRegexValidator(
                          maxLength: 8,
                        ),
                      ),
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: nonActiveColor,
                      ),
                      hintText: 'от'.tr(),
                      border: InputBorder.none,
                    ),
                  ),
                ).expanded(),
                SizedBox(width: 16),
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: TextField(
                    controller: _priceToController,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      ReplaceInputFormatter(from: ',', replace: '.'),
                      LeadingZeroWithDotInputFormatter(),
                      ValidatorInputFormatter(
                        editingValidator: DecimalNumberEditingRegexValidator(
                          maxLength: 8,
                        ),
                      ),
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: nonActiveColor,
                      ),
                      hintText: 'до'.tr(),
                      border: InputBorder.none,
                    ),
                  ),
                ).expanded(),
                SizedBox(width: 16),
                Text(
                  'USD',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: grey2Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Сортировать'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: grey2Color,
              ),
            ),
            SizedBox(height: 14),
            Container(
              height: 192,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    SelectionWidget(
                      onTap: () => _selectSort(SearchFilterSort.dateDesc),
                      child: Row(
                        children: [
                          SizedBox(width: 14),
                          Text(
                            'Сначала новые'.tr(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: grey2Color,
                            ),
                          ).expanded(),
                          SizedBox(width: 10),
                          if (_filter.sortSummary == SearchFilterSort.dateDesc)
                            FaIcon(
                              FontAwesomeIcons.checkCircle,
                              color: greenLightColor,
                              size: 20,
                            ),
                          SizedBox(width: 14),
                        ],
                      ),
                    ).expanded(),
                    Container(
                      color: greyDivider,
                      height: 1,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 14),
                    ),
                    SelectionWidget(
                      onTap: () => _selectSort(SearchFilterSort.dateAsc),
                      child: Row(
                        children: [
                          SizedBox(width: 14),
                          Text(
                            'Сначала старые'.tr(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: grey2Color,
                            ),
                          ).expanded(),
                          SizedBox(width: 10),
                          if (_filter.sortSummary == SearchFilterSort.dateAsc)
                            FaIcon(
                              FontAwesomeIcons.checkCircle,
                              color: greenLightColor,
                              size: 20,
                            ),
                          SizedBox(width: 14),
                        ],
                      ),
                    ).expanded(),
                    Container(
                      color: greyDivider,
                      height: 1,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 14),
                    ),
                    SelectionWidget(
                      onTap: () => _selectSort(SearchFilterSort.priceDesc),
                      child: Row(
                        children: [
                          SizedBox(width: 14),
                          Text(
                            'Сначала дорогие'.tr(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: grey2Color,
                            ),
                          ).expanded(),
                          SizedBox(width: 10),
                          if (_filter.sortSummary == SearchFilterSort.priceDesc)
                            FaIcon(
                              FontAwesomeIcons.checkCircle,
                              color: greenLightColor,
                              size: 20,
                            ),
                          SizedBox(width: 14),
                        ],
                      ),
                    ).expanded(),
                    Container(
                      color: greyDivider,
                      height: 1,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 14),
                    ),
                    SelectionWidget(
                      onTap: () => _selectSort(SearchFilterSort.priceAsc),
                      child: Row(
                        children: [
                          SizedBox(width: 14),
                          Text(
                            'Сначала дешевые'.tr(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: grey2Color,
                            ),
                          ).expanded(),
                          SizedBox(width: 10),
                          if (_filter.sortSummary == SearchFilterSort.priceAsc)
                            FaIcon(
                              FontAwesomeIcons.checkCircle,
                              color: greenLightColor,
                              size: 20,
                            ),
                          SizedBox(width: 14),
                        ],
                      ),
                    ).expanded(),
                  ],
                ),
              ),
            ),
            Spacer(),
            SizedBox(height: 14),
            ColoredButton(
              text: 'Продолжить'.tr(),
              width: double.infinity,
              height: ScreenUtil().setHeight(50),
              filled: true,
              color: mainLightColor,
              textSize: 14,
              borderRadius: ScreenUtil().setWidth(10),
              onPressed: _save,
            ),
            BottomSafeArea(height: 25),
          ],
        ),
      ),
    );
  }
}
