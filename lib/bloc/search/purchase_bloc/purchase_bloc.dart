import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'purchase_event.dart';
part 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final Dal dal;

  PurchaseBloc({required this.dal}) : super(PurchaseInitialState());

  @override
  Stream<PurchaseState> mapEventToState(
    PurchaseEvent event,
  ) async* {
    if (event is WaitingPaymentPurchaseEvent) {
      yield* _mapWaitingPaymentPurchaseEventToState(event);
    } else if (event is CanceledByBuyerPurchaseEvent) {
      yield LoadingPurchaseState();
      yield CanceledByBuyerPurchaseState(
        purchaseStateName: 'Операция отклонена',
      );
    } else if (event is ClearPurchaseEvent) {
      yield PurchaseInitialState();
    } else if (event is CurrencyPurchaseEvent) {
      yield* _mapCurrencyPurchaseEventToState(event);
    } else if (event is SendMoneyPurchaseEvent) {
      yield* _mapSendMoneyPurchaseEventToState(event);
    } else if (event is PaymentCompleteEvent) {
      yield* _mapPaymentCompleteEventToState(event);
    }
  }

  Stream<PurchaseState> _mapWaitingPaymentPurchaseEventToState(
    WaitingPaymentPurchaseEvent event,
  ) async* {
    yield LoadingPurchaseState();
    yield WaitingPaymentPurchaseState(
      purchaseStateName: 'Ожидает оплату',
    );
  }

  Stream<PurchaseState> _mapCurrencyPurchaseEventToState(
    CurrencyPurchaseEvent event,
  ) async* {
    yield LoadingPurchaseState();
    final detailsEither = await dal.searchService.openItemOrder(
      productId: event.productId,
      cancelToken: CancelToken(),
    );
    yield* detailsEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;
        yield ErrorPurchaseState(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (order) async* {
        yield CurrencyPurchaseState(
          price: event.price,
          purchaseStateName: 'Ожидает оплату',
          itemOrder: order,
        );
      },
    );
  }

  Stream<PurchaseState> _mapSendMoneyPurchaseEventToState(
    SendMoneyPurchaseEvent event,
  ) async* {
    yield LoadingPurchaseState();
    final currencyEither = await dal.searchService.chooseCurrency(
      orderId: event.orderId,
      returnAddress: event.returnAddress,
      currency: event.price.currency,
      cancelToken: CancelToken(),
    );
    yield* currencyEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;
        yield ErrorPurchaseState(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (qrCode) async* {
        yield SendMoneyPurchaseState(
          price: event.price,
          purchaseStateName: 'Переведённая сумма:',
          purchaseSum: '${event.price.amount} ${event.price.currency}',
          qrCode: qrCode,
        );
      },
    );
  }

  Stream<PurchaseState> _mapPaymentCompleteEventToState(
    PaymentCompleteEvent event,
  ) async* {
    yield LoadingPurchaseState();
    yield PaymentCompleteState(
      price: event.price,
      purchaseStateName: 'Оплата произведена:',
      purchaseSum: '${event.price.amount} ${event.price.currency}',
    );
  }
}
