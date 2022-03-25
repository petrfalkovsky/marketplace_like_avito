import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

showAddressDialog({
  required BuildContext context,
  required PriceModel currentPrice,
  required TextEditingController addressController,
  required GlobalKey addressForm,
  required ItemOrderModel itemOrder,
}) {
  final _purchaseBloc = BlocProvider.of<PurchaseBloc>(context);
  showDialog(
    context: context,
    builder: (_) => Material(
      color: Color(0xDFFFFFFF),
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(40),
                      right: ScreenUtil().setWidth(71),
                    ),
                    child: Text(
                      'В случае отмены сделки деньги будут вам возвращены'.tr(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: mainColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: ScreenUtil().setWidth(23),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setWidth(24),
                        child: Image.asset(
                          'assets/icons/icon-close.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Пожалуйста, введите адрес для возврата средств'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(40),
                ),
                child: Container(
                  //height: ScreenUtil().setHeight(40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          ScreenUtil().setWidth(10),
                        ),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: mainOpacityColor,
                          blurRadius: ScreenUtil().setWidth(2),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(16),
                        ),
                        child: Form(
                          key: addressForm,
                          child: TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Адрес кошелька'.tr(),
                            ),
                            validator: (address) {
                              if (address?.isEmpty ?? true) {
                                return 'Необходимо заполнить'.tr();
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            ScreenUtil().setWidth(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(40),
                ),
                child: ColoredButton(
                  text: 'Продолжить'.tr(),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(48),
                  color: mainLightColor,
                  filled: true,
                  textSize: 13,
                  borderRadius: ScreenUtil().setWidth(5),
                  onPressed: () {
                    _purchaseBloc.add(
                      SendMoneyPurchaseEvent(
                        price: currentPrice,
                        returnAddress: addressController.text,
                        orderId: itemOrder.id,
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
