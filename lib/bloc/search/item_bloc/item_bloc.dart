import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final Dal dal;
  late List<ProductItemModel> _previousItems;

  ItemBloc({required this.dal}) : super(ItemInitial()) {
    _previousItems = [];
  }

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is LoadingItemEvent) {
      yield LoadingItemState();
    } else if (event is GetItemEvent) {
      yield* _mapGetItemEventToState(event);
    } else if (event is AddPreviousItemEvent) {
      if (_previousItems.contains(event.item)) {
        _previousItems.remove(event.item);
      }
      _previousItems.add(event.item);
    }
  }

  Stream<ItemState> _mapGetItemEventToState(GetItemEvent event) async* {
    yield LoadingItemState();

    final detailsEither = await dal.searchService.getProductDetails(
      uri: event.uri,
      cancelToken: CancelToken(),
    );

    yield* detailsEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;
        yield ErrorItemState(error: mapFailureToMessage(failure: failure));
      },
      (productDetails) async* {
        yield GetItemState(
          productDetails: productDetails,
          previousItems: _previousItems,
        );
      },
    );
  }
}
