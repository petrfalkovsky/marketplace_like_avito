import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateAdStateWidget extends StatefulWidget {
  final TabController tabController;
  final CreateAdBloc createAdBloc;
  const CreateAdStateWidget({
    Key? key,
    required this.tabController,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  _CreateAdStateWidgetState createState() => _CreateAdStateWidgetState();
}

class _CreateAdStateWidgetState extends State<CreateAdStateWidget>
    with CancelMixin, AutomaticKeepAliveClientMixin {
  late CreateAdBloc _createAdBloc;

  final TextEditingController titleAdFieldController = TextEditingController();
  final TextEditingController descriptionAdFieldController =
      TextEditingController();
  final TextEditingController usdPriceFieldController = TextEditingController();
  final TextEditingController andAmountFieldController =
      TextEditingController();
  final TextEditingController andIdAddressFieldController =
      TextEditingController();
  final TextEditingController btcAmountFieldController =
      TextEditingController();
  final TextEditingController btcAddressFieldController =
      TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _createAdBloc = widget.createAdBloc;
    _createAdBloc.add(CreateAdStartedEvent());
  }

  @override
  void dispose() {
    titleAdFieldController.dispose();
    descriptionAdFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: whiteColor,
          hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: mainLightColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffef6f63), width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffef6f63), width: 1.0),
          ),
        ),
      ),
      child: BlocBuilder<CreateAdBloc, CreateAdState>(
        bloc: _createAdBloc,
        buildWhen: (_, __) {
          return true;
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state.switcher != CreateAdSwitcher.CreatedAdPart)
                SimpleSliverAppBar(titleText: 'Создание объявления'.tr()),
              if (state.status == CreateAdStatus.loading)
                SliverSafeArea(
                  sliver: SliverFillRemaining(
                    child: Center(
                      child: AntProgressIndicator(),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(25),
                    vertical: ScreenUtil().setHeight(30),
                  ),
                  sliver: _bodySlivers(state),
                ),
              // SliverSafeArea(
              //   sliver: SliverPadding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: ScreenUtil().setWidth(25),
              //       // vertical: ScreenUtil().setHeight(15),
              //     ),
              //     sliver: _bodySlivers(state),
              //     // sliver: SliverList(
              //     //   delegate: SliverChildListDelegate(
              //     //     _body(state),
              //     //   ),
              //     // ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }

  Widget _bodySlivers(CreateAdState state) {
    switch (state.switcher) {
      case CreateAdSwitcher.CategoryPart:
        return SliverList(
          delegate: SliverChildListDelegate([
            ChooseCityFieldWidget(
              createAdBloc: _createAdBloc,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            PhoneNumberFialdWidget(
              createAdBloc: _createAdBloc,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            ChooseCategoryFieldWidget(
              createAdBloc: _createAdBloc,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            ChooseSubCategoryFieldWidget(
              createAdBloc: _createAdBloc,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            ...subCategoryPropertiesListWidget(
              createAdBloc: _createAdBloc,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            TwoButtonsRowWidget(
              onPressedContinue: () {
                _createAdBloc.add(CreateAdCategoriesPartFilledEvent());
              },
              onPressedCancel: () {
                _createAdBloc.add(CreateAdStartedEvent());
              },
            ),
          ]),
        );

      case CreateAdSwitcher.PhotoPart:
        return SliverList(
          delegate: SliverChildListDelegate([
            PhotoFormWidget(
              onTap: () {
                _createAdBloc.add(CreateAdPickAndUploadPhotoEvent());
              },
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            if (state.uploadedPhotos?.isNotEmpty ?? false)
              HorizontalListViewPhotosWidget(
                photosList: state.uploadedPhotos!,
              ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            TwoButtonsRowWidget(
              onPressedContinue: () {
                _createAdBloc.add(CreateAdPhotoPartFilledEvent());
              },
              onPressedCancel: () {
                _createAdBloc.add(CreateAdTextPartFilledEvent(
                  titleAd: state.titleAd,
                  descriptionAd: state.descriptionAd,
                ));
              },
            ),
          ]),
        );

      case CreateAdSwitcher.MoneyPart:
        if (state.usdPrice != null) {
          if (state.usdPrice != usdPriceFieldController.text)
            usdPriceFieldController.text = state.usdPrice!;
          if (state.andPriceData != null) {
            if (state.andPriceData!.address != andIdAddressFieldController.text)
              andIdAddressFieldController.text = state.andPriceData!.address;
            if (state.andPriceData!.amount.toString() !=
                andAmountFieldController.text)
              andAmountFieldController.text =
                  state.andPriceData!.amount.toString();
          }
          if (state.btcPriceData != null) {
            if (state.btcPriceData!.address != btcAddressFieldController.text)
              btcAddressFieldController.text = state.btcPriceData!.address;
            if (state.btcPriceData!.amount.toString() !=
                btcAmountFieldController.text)
              btcAmountFieldController.text =
                  state.btcPriceData!.amount.toString();
          }
        } else {
          usdPriceFieldController.text = '';
          andIdAddressFieldController.text = '';
          andAmountFieldController.text = '';
          btcAddressFieldController.text = '';
          btcAmountFieldController.text = '';
        }

        return SliverList(
          delegate: SliverChildListDelegate([
            Text(
              'Цена'.tr(),
              maxLines: 1,
              style: AntaresMarketTextTheme.h6black2Color16w500,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: ScreenUtil().setHeight(14)),
            Text(
              'Обратите внимание!'.tr() +
                  '\n' +
                  'Цена включает в себя следующие комиссии:'.tr() +
                  '\n\n' +
                  'Комиссия за проведение безопасной сделки'.tr() +
                  '\n' +
                  'Внутренняя комиссия сети Bitcoin(при оплате данным способом).'
                      .tr() +
                  '\n' +
                  'Введите цену в USD'.tr(),
              maxLines: 10,
              style: AntaresMarketTextTheme.p3grey2Color14w400,
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            USDInputBlock(
              textController: usdPriceFieldController,
              onChanged: (String newValue) {
                _createAdBloc.add(CreateAdUSDChangedEvent(usdPrice: newValue));
              },
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            ANDInputBlock(
              andSelected: state.andPriceData?.enabled ?? false,
              andIdAddressFieldController: andIdAddressFieldController,
              andAmountFieldController: andAmountFieldController,
              onChanged: (String newValue) {
                _createAdBloc.add(CreateAdCurrencyChangedEvent(
                  currency: 'AND',
                  addressCurrency: newValue,
                ));
              },
              onTapCheckbox: (newValue) {
                _createAdBloc.add(CreateAdCurrencyChangedEvent(
                  currency: 'AND',
                  enabled: newValue,
                ));
              },
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            BTCInputBlock(
              usdPriceIsNotEmpty: state.usdPrice?.isNotEmpty ?? false,
              btcSelected: state.btcPriceData?.enabled ?? false,
              btcAddressFieldController: btcAddressFieldController,
              btcAmountFieldController: btcAmountFieldController,
              getBtc: state.getBtc ?? 0,
              getUsd: state.getUsd ?? 0,
              btcFee: state.btcFee ?? 0,
              safeTransactionBtcFee: state.safeTransactionBtcFee ?? 0,
              onChanged: (String newValue) {
                _createAdBloc.add(CreateAdCurrencyChangedEvent(
                  currency: 'BTC',
                  addressCurrency: newValue,
                ));
              },
              onTapCheckbox: (newValue) {
                _createAdBloc.add(CreateAdCurrencyChangedEvent(
                  currency: 'BTC',
                  enabled: newValue,
                ));
              },
            ),
            SizedBox(height: ScreenUtil().setHeight(30)),
            TwoButtonsRowWidget(
              onPressedContinue: () {
                _createAdBloc.add(CreateAdCurrencyChangedEvent(
                  currency: 'BTC',
                  addressCurrency: btcAddressFieldController.text,
                ));
                _createAdBloc.add(CreateAdMoneyPartFilledEvent(
                  btcAddress: btcAddressFieldController.text,
                ));
              },
              onPressedCancel: () {
                _createAdBloc.add(CreateAdCategoriesPartFilledEvent());
              },
            ),
          ]),
        );
      case CreateAdSwitcher.CreatedAdPart:
        return SliverSafeArea(
          sliver: SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/ok.png'),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Text(
                  'Объявление успешно создано'.tr(),
                  maxLines: 2,
                  style: AntaresMarketTextTheme.h2mainColor24w900,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                ElevatedButton(
                  onPressed: () {
                    _createAdBloc.add(CreateAdNewAdCreatedEvent());
                    widget.tabController.animateTo(0);
                  },
                  child: Text('OK'),
                  style: AntaresMarketButtonTheme.midleActiveButtonOneInRow,
                ),
              ],
            ),
          ),
        );

      case CreateAdSwitcher.TextPart:
      default:
        titleAdFieldController.text = state.titleAd;
        descriptionAdFieldController.text = state.descriptionAd;
        return SliverList(
          delegate: SliverChildListDelegate([
            TitleAdFieldWidget(
              titleAdFieldController: titleAdFieldController,
              errorText: state.titleAdError,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            DescriptionAdFieldWidget(
              descriptionAdFieldController: descriptionAdFieldController,
              errorText: state.descriptionAdError,
            ),
            SizedBox(height: ScreenUtil().setHeight(32)),
            TwoButtonsRowWidget(
              onPressedContinue: () {
                _createAdBloc.add(CreateAdTextPartFilledEvent(
                  titleAd: titleAdFieldController.text,
                  descriptionAd: descriptionAdFieldController.text,
                ));
              },
              onPressedCancel: () {
                _createAdBloc.add(CreateAdDataClearedEvent());
              },
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
          ]),
        );
    }
  }
/*   List<Widget> _body(CreateAdState state) {
    switch (state.switcher) {
      case CreateAdSwitcher.CategoryPart:
        return categoryPartFillingWidget(state);
      case CreateAdSwitcher.PhotoPart:
        return photoPartFillingWidget(state);
      case CreateAdSwitcher.MoneyPart:
        return moneyPartFillingWidget(state);
      case CreateAdSwitcher.CreatedAdPart:
        return newCreatedAdStateWidget(state);
      case CreateAdSwitcher.TextPart:
      default:
        return textPartFillingWidget(state);
    }
  }

  ///
  /// Text Part
  ///

  SliverList textPartFillingWidget(CreateAdState state) {
    // if (titleAdFieldController.text != state.titleAd)
    titleAdFieldController.text = state.titleAd;
    // if (descriptionAdFieldController.text != state.descriptionAd)
    descriptionAdFieldController.text = state.descriptionAd;
    return SliverList(
      delegate: SliverChildListDelegate([
        /// TODO: Для Пети.
        ///
        /// Поиграйся со свойствами TextField и настрой border для каждого состояния
        /// errorBorder, EnebleBorder, FilledDorder .
        /// Посмотри если как-то можно ограничить высоту
        /// у DescriptionAdFieldWidget. Возможно в свойствах есть.
        /// --
        /// Петя сделал:
        /// - установил максимальную высоту maxLines: 30
        /// - добавил MediaQuery в паддинг и поставил у скаффолда по всему приложению
        /// свойство Scaffold(resizeToAvoidBottomInset: true, чтобы клавиатура
        /// никогда не закрывала вводимый текст в формах
        /// - настроил фикс размер у поля обернув в контейнер
        /// - и добавил focusedBorder при активной форме
        ///
        TitleAdFieldWidget(
          titleAdFieldController: titleAdFieldController,
          errorText: state.titleAdError,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        DescriptionAdFieldWidget(
          descriptionAdFieldController: descriptionAdFieldController,
          errorText: state.descriptionAdError,
        ),
        SizedBox(height: ScreenUtil().setHeight(32)),
        TwoButtonsRowWidget(
          onPressedContinue: () {
            _createAdBloc.add(CreateAdTextPartFilledEvent(
              titleAd: titleAdFieldController.text,
              descriptionAd: descriptionAdFieldController.text,
            ));
          },
          onPressedCancel: () {
            _createAdBloc.add(CreateAdDataClearedEvent());
          },
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
      ]),
    );
  }

  ///
  /// Category Part
  ///

  SliverList categoryPartFillingWidget(CreateAdState state) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ChooseCityFieldWidget(
          createAdBloc: _createAdBloc,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        PhoneNumberFialdWidget(
          createAdBloc: _createAdBloc,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        ChooseCategoryFieldWidget(
          createAdBloc: _createAdBloc,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        ChooseSubCategoryFieldWidget(
          createAdBloc: _createAdBloc,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        ...subCategoryPropertiesListWidget(
          createAdBloc: _createAdBloc,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        TwoButtonsRowWidget(
          onPressedContinue: () {
            _createAdBloc.add(CreateAdCategoriesPartFilledEvent());
          },
          onPressedCancel: () {
            _createAdBloc.add(CreateAdStartedEvent());
          },
        ),
      ]),
    );
  }

  ///
  /// Photo Part
  ///

  List<Widget> photoPartFillingWidget(CreateAdState state) {
    return [];
  }

  ///
  /// Money Part
  ///

  List<Widget> moneyPartFillingWidget(CreateAdState state) {
    return [];
  }

  ///
  /// New Created Ad
  ///

  List<Widget> newCreatedAdStateWidget(CreateAdState state) {
    return [];
  }
*/
}

class BTCInputBlock extends StatelessWidget {
  final bool btcSelected;
  final bool usdPriceIsNotEmpty;
  final double safeTransactionBtcFee;
  final double btcFee;
  final double getBtc;
  final double getUsd;

  final TextEditingController btcAmountFieldController;
  final TextEditingController btcAddressFieldController;
  final void Function(bool) onTapCheckbox;
  final void Function(String) onChanged;

  const BTCInputBlock({
    Key? key,
    this.getBtc = 0,
    this.getUsd = 0,
    this.btcFee = 0,
    this.safeTransactionBtcFee = 0,
    required this.btcSelected,
    required this.onTapCheckbox,
    required this.onChanged,
    required this.usdPriceIsNotEmpty,
    required this.btcAddressFieldController,
    required this.btcAmountFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            'BTC',
            maxLines: 10,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
          value: btcSelected,
          onChanged: (bool? value) {
            onTapCheckbox(value ?? false);
          },
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
        TextField(
          enabled: false,
          controller: btcAmountFieldController,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            fillColor: grey4Color,
            hintText: '0',
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        if (usdPriceIsNotEmpty) ...[
          Text(
            'Комиссия за проведение безопасной сделки'.tr() + ':',
            maxLines: 1,
            style: AntaresMarketTextTheme.p3grey2Color14w400,
          ),
          Text(
            safeTransactionBtcFee.toStringAsFixed(8) + ' BTC',
            maxLines: 1,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          Text(
            'Внутренняя комиссия сети Bitcoin:'.tr(),
            maxLines: 1,
            style: AntaresMarketTextTheme.p3grey2Color14w400,
          ),
          Text(
            btcFee.toStringAsFixed(3) + ' BTC',
            maxLines: 1,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
        ],
        SizedBox(height: ScreenUtil().setHeight(10)),
        TextField(
          enabled: btcSelected,
          controller: btcAddressFieldController,
          keyboardType: TextInputType.name,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter
          ],
          onChanged: (String value) => onChanged(value),
          decoration: InputDecoration(
            hintText: 'Адрес кошелька'.tr(),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(15)),
        if (usdPriceIsNotEmpty) ...[
          Text(
            'Вы получите:'.tr(),
            maxLines: 1,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Text(
            getBtc.toStringAsFixed(8) + ' BTC',
            maxLines: 1,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
          Text(
            getUsd.toStringAsFixed(2) + ' BTC',
            maxLines: 1,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
        ],
      ],
    );
  }
}

class ANDInputBlock extends StatelessWidget {
  final bool andSelected;
  final TextEditingController andAmountFieldController;
  final TextEditingController andIdAddressFieldController;
  final void Function(bool) onTapCheckbox;
  final void Function(String) onChanged;

  const ANDInputBlock({
    Key? key,
    this.andSelected = false,
    required this.andAmountFieldController,
    required this.andIdAddressFieldController,
    required this.onTapCheckbox,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            'AND',
            maxLines: 1,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
          contentPadding: EdgeInsets.zero,
          value: andSelected,
          onChanged: (bool? newValue) => onTapCheckbox(newValue ?? false),
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
        TextField(
          controller: andAmountFieldController,
          enabled: false,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            fillColor: grey4Color,
            hintText: '0',
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        TextField(
          controller: andIdAddressFieldController,
          enabled: andSelected,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter
          ],
          onChanged: (String value) => onChanged(value),
          decoration: InputDecoration(
            hintText: 'Укажите свой Antares ID'.tr(),
          ),
        ),
      ],
    );
  }
}

class USDInputBlock extends StatelessWidget {
  final TextEditingController textController;
  final void Function(String) onChanged;

  const USDInputBlock({
    Key? key,
    required this.textController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'USD',
          maxLines: 1,
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        TextField(
          controller: textController,
          keyboardType: TextInputType.number,

          /// TODO: Надо переделать входной формат. Допускаються только цифры от 0 до 9 и точка '.'
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          maxLength: 10,
          onChanged: (String value) => onChanged(value),
          decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            hintText: '0',
            errorText: null,
          ),
        ),
      ],
    );
  }
}

class HorizontalListViewPhotosWidget extends StatelessWidget {
  final List<UploadedPhotoDataModel> photosList;
  const HorizontalListViewPhotosWidget({
    Key? key,
    required this.photosList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: ScreenUtil().setHeight(96),
          ),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: photosList.length,
            itemBuilder: (BuildContext context, int index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: nonActiveContainerColor,
              ),
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
              height: ScreenUtil().setHeight(90),
              width: ScreenUtil().setHeight(90),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: photosList[index].url,
                  fit: BoxFit.cover,
                  placeholder: (context, _) => AntProgressIndicator().center(),
                  cacheManager: AppCacheManager(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoFormWidget extends StatelessWidget {
  final VoidCallback onTap;
  const PhotoFormWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Загрузите фотографии'.tr(),
          style: AntaresMarketTextTheme.p2grey2Color14w700,
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
        InkWell(
          onTap: () {
            onTap.call();
          },
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            width: ScreenUtil().setWidth(248),
            height: ScreenUtil().setHeight(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/ic-photo.png',
                  cacheHeight: ScreenUtil().setHeight(60).ceil(),
                  cacheWidth: ScreenUtil().setHeight(60).ceil(),
                  width: ScreenUtil().setHeight(60),
                  height: ScreenUtil().setHeight(60),
                ),
                Text(
                  'Добавить'.tr(),
                  style: AntaresMarketTextTheme.p3grey2Color14w400,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
