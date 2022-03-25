import 'package:antares_market/bloc/index.dart';
import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencySwitch extends StatefulWidget {
  final List<PriceModel> prices;
  final TextEditingController addressController;
  final GlobalKey addressForm;

  const CurrencySwitch({
    Key? key,
    required this.prices,
    required this.addressController,
    required this.addressForm,
  }) : super(key: key);

  @override
  _CurrencySwitchState createState() => _CurrencySwitchState();
}

class _CurrencySwitchState extends State<CurrencySwitch> with StateUtilsMixin {
  late PurchaseBloc _purchaseBloc;
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = false;
    _purchaseBloc = BlocProvider.of<PurchaseBloc>(context);
  }

  Widget _currency({
    required List<PriceModel> prices,
    required int index,
    required bool expanded,
    required BuildContext currencyContext,
  }) {
    final currentPrice = prices[index];
    return Expanded(
      child: TextButton(
        onPressed: () {
          if (expanded) {
            _purchaseBloc.add(CurrencyPurchaseEvent(
              price: currentPrice,
              productId: '',
            ));
            setState(() {
              _expanded = false;
            });
          } else {
            setState(() {
              _expanded = true;
            });
          }
        },
        child: Row(
          children: [
            BlocBuilder<PurchaseBloc, PurchaseState>(
              bloc: _purchaseBloc,
              builder: (context, PurchaseState purchaseState) {
                Color _textColor = mainColor;
                if (purchaseState is CurrencyPurchaseState) {
                  if (currentPrice == purchaseState.price && !_expanded) {
                    _textColor = greenLightColor;
                    SchedulerBinding.instance!.addPostFrameCallback((_) {
                      showAddressDialog(
                        context: currencyContext,
                        currentPrice: purchaseState.price,
                        addressController: widget.addressController,
                        addressForm: widget.addressForm,
                        itemOrder: purchaseState.itemOrder,
                      );
                    });
                  }
                }
                return Text(
                  currentPrice.amount + ' ' + currentPrice.currency,
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ],
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      bloc: _purchaseBloc,
      builder: (context, PurchaseState purchaseState) {
        List<PriceModel> _showPrices;
        if (purchaseState is CurrencyPurchaseState) {
          _showPrices = [purchaseState.price];
        } else {
          _showPrices = [widget.prices.first];
        }
        if (_expanded) {
          _showPrices = widget.prices;
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(15),
            vertical: ScreenUtil().setHeight(8),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  ScreenUtil().setWidth(20),
                ),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: _expanded ? greenLightColor : mainOpacityColor,
                  blurRadius: ScreenUtil().setWidth(5),
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(16),
                ),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _showPrices.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index > 0) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _currency(
                              prices: _showPrices,
                              index: index,
                              expanded: _expanded,
                              currencyContext: context,
                            ),
                          ],
                        );
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _currency(
                              prices: _showPrices,
                              index: index,
                              expanded: _expanded,
                              currencyContext: context,
                            ),
                            InkWell(
                              child: ChevronWidget(expanded: _expanded),
                              onTap: () {
                                setState(() {
                                  _expanded = !_expanded;
                                });
                              },
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    ScreenUtil().setWidth(20),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
