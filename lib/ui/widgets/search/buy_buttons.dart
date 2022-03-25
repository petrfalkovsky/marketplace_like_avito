import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/core/mixin/state_utils_mixin.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BuyButtons extends StatefulWidget {
  final BuildContext context;

  const BuyButtons({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  _BuyButtonsState createState() => _BuyButtonsState();
}

class _BuyButtonsState extends State<BuyButtons> with StateUtilsMixin {
  // ignore: close_sinks
  late ItemBloc _itemBloc;
  late PurchaseBloc _purchaseBloc;

  @override
  void initState() {
    _itemBloc = BlocProvider.of<ItemBloc>(context);
    _purchaseBloc = BlocProvider.of<PurchaseBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _carouselPopUp({required List<PhotoModel> photos}) {
    return Container(
      width: ScreenUtil().setWidth(339),
      child: CarouselSlider.builder(
        itemCount: photos.length,
        options: CarouselOptions(
          height: ScreenUtil().setHeight(264),
          aspectRatio: 16 / 9,
          autoPlay: true,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (
          BuildContext context,
          int imageIndex,
          int realIndex,
        ) {
          final _photo = photos[imageIndex];
          return FutureBuilder(
            future: CachedImageSource.get(url: _photo.original),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(20),
                  ),
                  child: Image.file(
                    snapshot.data,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return Center(
                  child: AntProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _alertTextPoint({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: mainColor,
      ),
    ).tr();
  }

  _showDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (_) => Material(
        //type: MaterialType.transparency,
        color: Color(0xDFFFFFFF),
        child: Center(
          child: BlocBuilder<ItemBloc, ItemState>(
            bloc: _itemBloc,
            builder: (context, itemState) {
              if (itemState is GetItemState) {
                return Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      _carouselPopUp(
                        photos: itemState.productDetails.photosFilenames,
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(24),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(339),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _alertTextPoint(
                              text: '1. Свяжитесь с продавцом по email.',
                            ),
                            _alertTextPoint(
                              text:
                                  '2. Произведите оплату через Antares Market (продавец получит деньги только после того, как вы подтвердите сделку)',
                            ),
                            _alertTextPoint(
                              text: '3. Получите товар у продавца.',
                            ),
                            _alertTextPoint(
                              text:
                                  '4. Подтвердите в личном кабинете, что сделка состоялась',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(24),
                      ),
                      ColoredButton(
                        text: 'Хорошо'.tr(),
                        width: ScreenUtil().setWidth(168),
                        height: ScreenUtil().setHeight(48),
                        color: mainLightColor,
                        filled: true,
                        textSize: 13,
                        borderRadius: ScreenUtil().setWidth(5),
                        onPressed: () {
                          _purchaseBloc.add(WaitingPaymentPurchaseEvent());
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                );
              } else {
                return AntProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _noMoneyButton() {
    return ColoredButton(
      text: 'Нет крипты? Жми сюда!'.tr(),
      width: ScreenUtil().setWidth(168),
      height: ScreenUtil().setHeight(48),
      color: orangeColor,
      filled: false,
      textSize: 13,
      borderRadius: ScreenUtil().setWidth(5),
      onPressed: () {},
    );
  }

  Widget _buyButton() {
    return ColoredButton(
      text: 'Купить за крипту'.tr(),
      width: ScreenUtil().setWidth(168),
      height: ScreenUtil().setHeight(48),
      filled: true,
      color: orangeColor,
      textSize: 13,
      borderRadius: ScreenUtil().setHeight(5),
      onPressed: () {
        _showDialog(context: widget.context);
      },
    );
  }

  Widget _rejectButton() {
    return ColoredButton(
      text: 'Отклонить'.tr(),
      width: ScreenUtil().setWidth(168),
      height: ScreenUtil().setHeight(48),
      filled: true,
      color: greyDivider,
      textSize: 13,
      borderRadius: ScreenUtil().setHeight(5),
      onPressed: () {
        _purchaseBloc.add(CanceledByBuyerPurchaseEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
        vertical: ScreenUtil().setHeight(8),
      ),
      child: BlocBuilder<PurchaseBloc, PurchaseState>(
        bloc: _purchaseBloc,
        builder: (context, purchaseState) {
          if (purchaseState is WaitingPaymentPurchaseState ||
              purchaseState is CurrencyPurchaseState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _rejectButton(),
                _noMoneyButton(),
              ],
            );
          } else if (purchaseState is CanceledByBuyerPurchaseState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buyButton(),
                _noMoneyButton(),
              ],
            );
          } else if (purchaseState is SendMoneyPurchaseState) {
            return _noMoneyButton();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buyButton(),
                _noMoneyButton(),
              ],
            );
          }
        },
      ),
    );
  }
}
