part of 'purchase_bloc.dart';

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();
}

class ClearPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class LoadingPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class WaitingPaymentPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class CanceledByBuyerPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class CanceledBySellerPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class CurrencyPurchaseEvent extends PurchaseEvent {
  final PriceModel price;
  final String productId;

  CurrencyPurchaseEvent({
    required this.price,
    required this.productId,
  });

  @override
  List<Object?> get props => [
        price,
        productId,
      ];
}

class SendMoneyPurchaseEvent extends PurchaseEvent {
  final PriceModel price;
  final String orderId;
  final String returnAddress;

  SendMoneyPurchaseEvent({
    required this.price,
    required this.orderId,
    required this.returnAddress,
  });

  @override
  List<Object?> get props => [
        price,
        orderId,
        returnAddress,
      ];
}

class PaymentCompleteEvent extends PurchaseEvent {
  final PriceModel price;

  PaymentCompleteEvent({
    required this.price,
  });

  @override
  List<Object?> get props => [price];
}

class AssertDealPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class DealIsDonePurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class SuccessPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}
