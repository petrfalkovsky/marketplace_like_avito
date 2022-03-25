import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ChoosePaymentWidget extends StatefulWidget {
  final List<PriceModel> prices;

  const ChoosePaymentWidget({
    Key? key,
    required this.prices,
  }) : super(key: key);

  @override
  _ChoosePaymentWidgetState createState() => _ChoosePaymentWidgetState();
}

class _ChoosePaymentWidgetState extends State<ChoosePaymentWidget>
    with StateUtilsMixin {
  late PurchaseBloc _purchaseBloc;
  late List<PriceModel> _prices;
  late TextEditingController _addressController;
  late GlobalKey _addressForm;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _purchaseBloc = BlocProvider.of<PurchaseBloc>(context);
    _prices = widget.prices;
    _addressController = TextEditingController();
    _addressForm = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _qrCodeButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(15),
        ScreenUtil().setHeight(8),
        ScreenUtil().setWidth(15),
        ScreenUtil().setHeight(16),
      ),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(24),
            height: ScreenUtil().setWidth(24),
            child: Image.asset('assets/icons/qr_code.png'),
          ),
          Text(
            'Получить адрес'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: mainFlatColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      bloc: _purchaseBloc,
      builder: (context, PurchaseState purchaseState) {
        if (purchaseState is LoadingPurchaseState) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
              vertical: ScreenUtil().setHeight(8),
            ),
            child: Container(
              height: ScreenUtil().setHeight(48),
              child: Center(
                child: AntProgressIndicator(),
              ),
            ),
          );
        } /*else if (purchaseState is ErrorPurchaseState) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
              vertical: ScreenUtil().setHeight(8),
            ),
            child: Container(
              height: ScreenUtil().setHeight(50),
              child: ListView.builder(
                itemCount: purchaseState.errors.length,
                itemBuilder: (context, index) {
                  return Text(purchaseState.errors[index]);
                },
              ),
            ),
          );
        }*/
        else if (purchaseState is WaitingPaymentPurchaseState ||
            purchaseState is CurrencyPurchaseState) {
          return Column(
            children: [
              CurrencySwitch(
                prices: _prices,
                addressController: _addressController,
                addressForm: _addressForm,
              ),
              _qrCodeButton(),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
