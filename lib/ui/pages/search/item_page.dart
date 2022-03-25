import 'dart:ui';

import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:antares_market/ui/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({
    Key? key,
  }) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> with StateUtilsMixin {
  static const BITCOIN = 'BTC';
  static const ANDCOIN = 'AND';

  late ProductItemModel _productItem;
  late List<ItemCategoryModel> _categories;
  late FavoritesBloc _favoritesBloc;

  int _currentImage = 1;
  late ItemBloc _itemBloc;
  late PurchaseBloc _purchaseBloc;

  @override
  void didInitDependencies() {
    super.didInitDependencies();
    final productItem =
        args?.checkMapAndGet('productItem').asCast<ProductItemModel>();
    if (productItem == null) {
      throw ArgumentError.notNull('productItem');
    }
    _productItem = productItem;

    final categories =
        args?.checkMapAndGet('categories').asCast<List<ItemCategoryModel>>();
    if (categories == null) {
      throw ArgumentError.notNull('categories');
    }
    _categories = categories;

    _itemBloc = BlocProvider.of<ItemBloc>(context);
    _itemBloc.add(GetItemEvent(uri: _productItem.uri));
    _purchaseBloc = BlocProvider.of<PurchaseBloc>(context);
    _purchaseBloc.add(ClearPurchaseEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  /* @override
  Widget build2(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: mainColor,
        ),
        actions: [
          _favButton(),
        ],
      ),
      body: PageBackground(
        child: SafeArea(
          child: BlocBuilder<ItemBloc, ItemState>(
            bloc: _itemBloc,
            builder: (context, itemState) {
              if (itemState is ErrorItemState) {
                return Center(
                  child: Text(
                    itemState.error,
                  ),
                );
              } else if (itemState is GetItemState) {
                return _itemStateWidget(itemState);
              } else {
                _currentImage = 1;
                return Container(
                  child: Center(
                    child: AntProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
        bloc: _itemBloc,
        builder: (context, itemState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: mainColor,
              ),
              actions: [
                if (itemState is GetItemState)
                  _favButton(
                    productId: itemState.productDetails.id,
                    isFav: itemState.productDetails.isFavorite,
                    productUri: itemState.productDetails.uri,
                  ),
              ],
            ),
            body: PageBackground(
              child: SafeArea(
                child: (() {
                  if (itemState is ErrorItemState) {
                    return Center(
                      child: Text(
                        itemState.error,
                      ),
                    );
                  } else if (itemState is GetItemState) {
                    return _itemStateWidget(itemState);
                  } else {
                    _currentImage = 1;
                    return Container(
                      child: Center(
                        child: AntProgressIndicator(),
                      ),
                    );
                  }
                }()),
              ),
            ),
          );
        });
  }

  Widget _itemStateWidget(GetItemState itemState) {
    final categories = _categories;
    final productDetails = itemState.productDetails;
    final properties = productDetails.properties;
    final List<Map<String, dynamic>> propertiesWithNames = [];
    properties.forEach((prop) {
      var propertyId = prop.property;
      var valueId = prop.value;
      var subValueId = prop.subValue;
      Map<String, dynamic> propAndValue = Map<String, dynamic>();
      _mapSpecifications(
        categories,
        propertyId,
        propAndValue,
        valueId,
        subValueId,
      );
      propertiesWithNames.add(propAndValue);
    });
    final _previousItems = itemState.previousItems;
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      bloc: _purchaseBloc,
      builder: (context, purchaseState) {
        Widget? _errorWindow;
        if (purchaseState is ErrorPurchaseState) {
          _errorWindow = Container(
            width: ScreenUtil().setWidth(300),
            child: ErrorsDialog(
              onPressed: () {
                _purchaseBloc.add(ClearPurchaseEvent());
              },
              errors: purchaseState.errors,
              windowText: 'Обратите внимание!',
              buttonText: 'Login',
            ),
          );
        }
        return Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(15),
                  ),
                  child: Text(
                    productDetails.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: mainColor,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    _carousel(photos: productDetails.photosFilenames),
                    _imageCounter(
                      photos: productDetails.photosFilenames,
                      currentImage: _currentImage,
                    ),
                    PurchaseStateBadge(),
                  ],
                ),
                _statistics(
                  cityName: productDetails.city?.name ?? '',
                  countViews: productDetails.countViews,
                  created: productDetails.created,
                ),
                _bigPrice(usdPrice: productDetails.usdPrice),
                _pricing(prices: productDetails.prices),
                SizedBox(
                  height: ScreenUtil().setHeight(2),
                ),
                ChoosePaymentWidget(prices: productDetails.prices),
                SizedBox(
                  height: ScreenUtil().setHeight(2),
                ),
                QrCodeWidget(),
                BuyButtons(context: context),
                _infoButton(context),
                SellerButton(
                  sellerName:
                      '${productDetails.userSeller?.firstName ?? ''} ${productDetails.userSeller?.lastName ?? ''}',
                ),
                WriteSellerWidget(),
                IfBuild(
                  check: properties.length > 0,
                  ifTrue: (context) => ItemDivider(),
                ),
                IfBuild(
                  check: properties.length > 0,
                  ifTrue: (context) => Container(
                    child: _headingText(
                      context: context,
                      text: 'Характеристики'.tr(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: properties.length > 0
                        ? ScreenUtil().setWidth(15)
                        : ScreenUtil().setWidth(5),
                    vertical: ScreenUtil().setHeight(14),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: propertiesWithNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      // TODO: Check if sub and subValue needed to be displayed
                      /*String _value = '';
                                  if (propertiesWithNames[index]['subValue'] != null) {
                                    _value = propertiesWithNames[index]['subValue'];
                                  } else {
                                    _value = propertiesWithNames[index]['value'];
                                  }*/
                      String _value = '${propertiesWithNames[index]['value']}';
                      if (propertiesWithNames[index]['value'] is String) {
                        _value = _value.tr();
                      }
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${propertiesWithNames[index]['property']}'.tr() +
                                  ':',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: mainFlatColor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              _value,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                ItemDivider(),
                _headingText(
                  context: context,
                  text: 'Описание'.tr(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(15),
                    vertical: ScreenUtil().setHeight(14),
                  ),
                  child: Text(
                    productDetails.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                IfBuild(
                  check: _previousItems.length > 0,
                  ifTrue: (context) => _headingText(
                    context: context,
                    text: 'Вы смотрели'.tr(),
                  ),
                ),
                /* IfBuild(
                  check: _previousItems.length > 0,
                  ifTrue: (context) => _previousList(
                    products: _previousItems,
                    categories: _categories,
                  ),
                ),*/
              ],
            ),
            if (_errorWindow != null) BlurredBackground(child: _errorWindow),
          ],
        );
      },
    );
  }

  Widget _carousel({required List<PhotoModel> photos}) {
    return CarouselSlider.builder(
      itemCount: photos.length,
      options: CarouselOptions(
        height: ScreenUtil().setHeight(264),
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          setState(() {
            _currentImage = index + 1;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (
        BuildContext context,
        int imageIndex,
        int realIndex,
      ) {
        final _photo = photos[imageIndex];
        return Container(
          child: FutureBuilder(
            future: CachedImageSource.get(url: _photo.original),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Image.file(
                  snapshot.data,
                  fit: BoxFit.cover,
                );
              } else {
                return Center(
                  child: AntProgressIndicator(),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _statInfoText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        color: nonActiveColor,
        fontSize: 14,
      ),
    );
  }

  Widget _statistics({
    required String cityName,
    required int? countViews,
    required DateTime? created,
  }) {
    String _cityName = '-';
    String _countViews = '-';
    String _created = '-';
    if (cityName != '') {
      _cityName = cityName;
    }
    if (countViews != null) {
      _countViews = countViews.toString();
    }
    if (created != null) {
      _created = DateFormat('dd MMMM kk:mm').format(
        created,
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(width: ScreenUtil().setWidth(20)),
                Container(
                  height: ScreenUtil().setHeight(20),
                  child: Image.asset('assets/icons/address.png'),
                ),
                SizedBox(width: ScreenUtil().setWidth(5)),
                Expanded(child: _statInfoText(text: _cityName)),
                SizedBox(width: ScreenUtil().setWidth(12)),
                Container(
                  height: ScreenUtil().setHeight(20),
                  child: Image.asset('assets/icons/eye.png'),
                ),
                SizedBox(width: ScreenUtil().setWidth(5)),
                _statInfoText(text: _countViews),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(15),
                  ),
                  child: _statInfoText(
                    text: _created,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageCounter({
    required List<PhotoModel> photos,
    required int currentImage,
  }) {
    String _imagePagination = '';
    if (photos.isNotEmpty) {
      _imagePagination = '$currentImage / ${photos.length}';
    }
    return Positioned(
      bottom: ScreenUtil().setHeight(15),
      left: ScreenUtil().setWidth(24),
      child: Container(
        width: ScreenUtil().setWidth(56),
        height: ScreenUtil().setHeight(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(10),
          ),
          color: Color.fromRGBO(20, 20, 20, 0.5),
        ),
        child: Center(
          child: Text(
            _imagePagination,
            style: TextStyle(
              fontSize: 12,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bigPrice({required double? usdPrice}) {
    String _usdItemPrice = '-';
    if (usdPrice != null) {
      _usdItemPrice = usdPrice.toStringAsFixed(2);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(15),
          ),
          child: Text(
            '\$$_usdItemPrice',
            style: TextStyle(
              fontSize: 24,
              color: mainColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }

  Widget _pricing({required List<PriceModel> prices}) {
    String _priceBit = '-';
    String _priceAnd = '-';
    if (prices.isNotEmpty) {
      prices.forEach((price) {
        switch (price.currency) {
          case BITCOIN:
            _priceBit = price.amount;
            break;
          case ANDCOIN:
            _priceAnd = price.amount;
            break;
          default:
            break;
        }
      });
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
          ),
          child: Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(20),
                child: Image.asset('assets/icons/bitcoin.png'),
              ),
              Text(
                _priceBit,
                style: TextStyle(
                  fontSize: 14,
                  color: grey2Color,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
          ),
          child: Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(20),
                child: Image.asset('assets/icons/andicon.png'),
              ),
              Text(
                _priceAnd,
                style: TextStyle(
                  fontSize: 14,
                  color: grey2Color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _favButton(
      {required bool isFav,
      required String productId,
      required String productUri}) {
    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    return IconButton(
      onPressed: () {
        _favoritesBloc.add(ChangeFavoritesEvent(productId: productId));
        _itemBloc.add(GetItemEvent(uri: productUri));
        setState(() {});
      },
      icon: Icon(isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart),
      color: isFav ? heartColor : mainColor,
    );
  }

  Widget _infoButton(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(20),
      child: TextButton(
        onPressed: () {
          buildShowModalBottomSheet(context);
        },
        child: Text(
          'Как работает безопасная сделка'.tr(),
          style: TextStyle(
            color: mainFlatColor,
            fontSize: 14,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }

  Widget _headingText({
    required BuildContext context,
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: mainColor,
        ),
      ),
    );
  }

  Widget _previousList({
    required List<ProductItemModel> products,
    required List<ItemCategoryModel> categories,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          final productItem = products[index];
          return ProductWidget(
            productItem: productItem,
            categories: categories,
            replace: true,
          );
        },
      ),
    );
  }

  void _mapSpecifications(
    List<ItemCategoryModel> categories,
    propertyId,
    Map<String, dynamic> propAndValue,
    valueId,
    subValueId,
  ) {
    categories.forEach((category) {
      category.subCategories.forEach((sub) {
        sub.properties.forEach((element) {
          if (element.id == propertyId) {
            propAndValue['sub'] = sub.name;
            propAndValue['property'] = element.title;
          }
          element.listOptions.forEach((listOption) {
            if (valueId is String) {
              if (listOption.id == valueId) {
                propAndValue['value'] = listOption.title;
              }
            } else {
              propAndValue['value'] = valueId;
            }
            listOption.subOptions.forEach((subOption) {
              if (subOption.id == subValueId) {
                propAndValue['subValue'] = subOption.title;
              }
            });
          });
        });
      });
    });
  }
}

Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(
        //   topLeft: const Radius.circular(50),
        //   topRight: const Radius.circular(50),
        // ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Безопасная сделка'.tr(),
            style: AntaresMarketTextTheme.h2mainColor24w900,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(ScreenUtil().radius(20)))),
          backgroundColor: whiteColor,
          toolbarHeight: ScreenUtil().setHeight(70),
          shadowColor: shadowAppBar,
          elevation: 10,
        ),
        body: Container(
          child: ProfileTabBarNavigation(),
        ),
      ),
    ),
  );
}

class ProfileTabBarNavigation extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Я продавец'.tr()),
    Tab(text: 'Я покупатель'.tr()),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          // color: mainColor,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Column(children: <Widget>[
          TabBar(
            tabs: myTabs,
            unselectedLabelColor: Colors.black54,
            unselectedLabelStyle: AntaresMarketTextTheme.p3grey2Color14w400,
            labelStyle: AntaresMarketTextTheme.h5grey2Color16w700,
            labelColor: blackColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text('Товар уже оплачен:'.tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                          'Покупатель вносит деньги за товар. Передайте или отправьте его и получите криптовалюту на свой кошелёк.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text('Как продавать с Безопасной сделкой:'.tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text('Получите заявку о сделке.'.tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text(
                          'Договоритесь об окончательной сумме и в какой криптовалюте.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text('Дождитесь оплаты покупателем.'.tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text(
                          'Когда покупатель получит товар мы переведем криптовалюту на ваш кошелёк.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text('Что если покупатель откажется от товара?'.tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                          'Вы можете открыть спор и такие случаи рассматриваются нашей технической поддержкой индивидуально. Если вы сможете доказать, что товар был передан или отправлен мы перечислим вам оплату за товар. Если товар не соответствовал описанию или не был передан, то мы вернем криптовалюту покупателю.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text('Что если я откажусь продавать?'.tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                          'Просто закройте объявление или отмените заявку, мы вернем оплату покупателю.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text('Безопасная сделка'.tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                          'Продавец получит вашу оплату только тогда, когда вы подтвердите получение товара.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text('Как покупать с Безопасной сделкой'.tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text('Выберите интересный вам товар.'.tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text('Ознакомитесь с описанием товара.'.tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text(
                          'Свяжитесь с продавцом и договоритесь об окончательной сумме и условиях передачи товара.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text(
                          'Оплатите товар указав свой кошелёк для случаев возврата и дождитесь подтверждения оплаты.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text(
                          'Получите товар убедившись, что он соответствует описанию.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      Text(
                          'Подтвердите получение товара, и мы переведем деньги продавцу.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text(
                          'Что если товар не получен или не соответствует описанию?'
                              .tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                          'Вы можете открыть спор и такие случаи рассматриваются нашей технической поддержкой индивидуально. Если товар не соответствовал описанию или не был передан, то мы вернем вам вашу оплату.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Text('Что если я откажусь покупать?'.tr(),
                          style: AntaresMarketTextTheme.h7mainColor16w500),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                          'Сообщите об этом продавцу до того, как он отправит или передаст вам товар. И мы вернем вам оплату на ваш кошелёк.'
                              .tr(),
                          style: AntaresMarketTextTheme.p1grey2Color16w400),
                    ],
                  ),
                ),
              ],
            ),

            /*   TabBarView(
              children: myTabs.map((Tab tab) {
                final String label = tab.text!.toLowerCase();
                return Center(
                  child: Text(
                    'This is the $label tab',
                    style: const TextStyle(fontSize: 36),
                  ),
                );
              }).toList(),
            ), */
          ),
        ]),
      ),
    );
  }
}
/* 


class TabBarViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              child: TabBar(
                indicatorColor: Colors.lime,
                indicatorWeight: 5.0,
                labelColor: Colors.black,
                labelPadding: EdgeInsets.only(top: 10.0),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Cake',
                    icon: Icon(
                      Icons.cake,
                      color: Colors.white,
                    ),
                    iconMargin: EdgeInsets.only(bottom: 10.0),
                  ),
                  //child: Image.asset('images/android.png'),

                  Tab(
                    text: 'Radio',
                    icon: Icon(
                      Icons.radio,
                      color: Colors.white,
                    ),
                    iconMargin: EdgeInsets.only(bottom: 10.0),
                  ),
                  Tab(
                    text: 'Gift',
                    icon: Icon(
                      Icons.card_giftcard,
                      color: Colors.white,
                    ),
                    iconMargin: EdgeInsets.only(bottom: 10.0),
                  ),
                ],
              ),
            ),
            Container(
              child: TabBarView(
                children: [
                  Center(
                      child: Text(
                    'This is Cake Tab',
                    style: TextStyle(fontSize: 32),
                  )),
                  Center(
                      child: Text(
                    'This is Radio Tab',
                    style: TextStyle(fontSize: 32),
                  )),
                  Center(
                      child: Text(
                    'This is Gift Tab',
                    style: TextStyle(fontSize: 32),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



 */
