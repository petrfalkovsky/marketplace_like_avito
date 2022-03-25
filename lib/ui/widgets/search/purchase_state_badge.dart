import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class PurchaseStateBadge extends StatefulWidget {
  @override
  _PurchaseStateBadgeState createState() => _PurchaseStateBadgeState();
}

class _PurchaseStateBadgeState extends State<PurchaseStateBadge>
    with StateUtilsMixin {
  late PurchaseBloc _purchaseBloc;

  @override
  void initState() {
    super.initState();
    _purchaseBloc = BlocProvider.of<PurchaseBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _badge({
    required String text,
    String? text2,
  }) {
    return Positioned(
      top: ScreenUtil().setHeight(15),
      left: ScreenUtil().setWidth(24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(10),
          ),
          color: blue3Color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(11),
              vertical: ScreenUtil().setHeight(6)),
          child: Center(
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    color: whiteColor,
                  ),
                ).tr(),
                text2 != null
                    ? Text(
                        text2,
                        style: TextStyle(
                          fontSize: 12,
                          color: whiteColor,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      bloc: _purchaseBloc,
      builder: (context, PurchaseState purchaseState) {
        if (purchaseState is WaitingPaymentPurchaseState) {
          return _badge(text: purchaseState.purchaseStateName);
        } else if (purchaseState is CanceledByBuyerPurchaseState) {
          return _badge(text: purchaseState.purchaseStateName);
        } else if (purchaseState is CurrencyPurchaseState) {
          return _badge(text: purchaseState.purchaseStateName);
        } else if (purchaseState is SendMoneyPurchaseState) {
          return _badge(
            text: purchaseState.purchaseStateName,
            text2: purchaseState.purchaseSum,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
