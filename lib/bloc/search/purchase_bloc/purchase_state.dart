part of 'purchase_bloc.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();
}

class PurchaseInitialState extends PurchaseState {
  @override
  List<Object?> get props => [];
}

class LoadingPurchaseState extends PurchaseState {
  @override
  List<Object?> get props => [];
}

class ErrorPurchaseState extends PurchaseState {
  final List<String> errors;

  ErrorPurchaseState({required this.errors});

  @override
  List<Object?> get props => [errors];
}

class WaitingPaymentPurchaseState extends PurchaseState {
  final String purchaseStateName;

  WaitingPaymentPurchaseState({
    required this.purchaseStateName,
  });

  @override
  List<Object?> get props => [
        purchaseStateName,
      ];
}

class CanceledByBuyerPurchaseState extends PurchaseState {
  final String purchaseStateName;

  CanceledByBuyerPurchaseState({required this.purchaseStateName});

  @override
  List<Object?> get props => [purchaseStateName];
}

class CanceledBySellerPurchaseState extends PurchaseState {
  final String purchaseStateName;

  CanceledBySellerPurchaseState({required this.purchaseStateName});

  @override
  List<Object?> get props => [purchaseStateName];
}

class CurrencyPurchaseState extends PurchaseState {
  final PriceModel price;
  final String purchaseStateName;
  final ItemOrderModel itemOrder;

  CurrencyPurchaseState({
    required this.price,
    required this.purchaseStateName,
    required this.itemOrder,
  });

  @override
  List<Object?> get props => [
        price,
        purchaseStateName,
        itemOrder,
      ];
}

class SendMoneyPurchaseState extends PurchaseState {
  final PriceModel price;
  final String purchaseStateName;
  final String purchaseSum;
  final String qrCode;

  SendMoneyPurchaseState({
    required this.price,
    required this.purchaseStateName,
    required this.purchaseSum,
    required this.qrCode,
  });

  @override
  List<Object?> get props => [
        price,
        purchaseStateName,
        purchaseSum,
        qrCode,
      ];
}

class PaymentCompleteState extends PurchaseState {
  final PriceModel price;
  final String purchaseStateName;
  final String purchaseSum;

  PaymentCompleteState({
    required this.price,
    required this.purchaseStateName,
    required this.purchaseSum,
  });

  @override
  List<Object?> get props => [
        price,
        purchaseStateName,
        purchaseSum,
      ];
}
