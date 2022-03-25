import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeWidget extends StatefulWidget {
  @override
  _QrCodeWidgetState createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> with StateUtilsMixin {
  late PurchaseBloc _purchaseBloc;
  late double _percent;
  late String _qrCode;

  @override
  void initState() {
    super.initState();
    _purchaseBloc = BlocProvider.of<PurchaseBloc>(context);
    _percent = 14.2;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      bloc: _purchaseBloc,
      builder: (context, PurchaseState purchaseState) {
        if (purchaseState is SendMoneyPurchaseState) {
          _qrCode = purchaseState.qrCode;
          return Column(
            children: [
              QrImage(
                data: purchaseState.price.id,
                version: QrVersions.auto,
                size: ScreenUtil().setWidth(350),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    _qrCode,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(24),
                    height: ScreenUtil().setWidth(24),
                    child: TextButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: _qrCode));
                      },
                      child: Image.asset('assets/icons/ic-copy.png'),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(23),
              ),
              OvalProgressIndicator(percent: _percent),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Text(
                _percent.toStringAsFixed(2),
                style: TextStyle(
                  color: mainFlatColor,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
