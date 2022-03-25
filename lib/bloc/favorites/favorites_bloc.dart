import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';
part 'favorites_bloc.g.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final Dal dal;

  FavoritesBloc({
    required this.dal,
  }) : super(FavoritesState(
          status: FavoritesStatus.loading,
          statusSwitch: FavoritesSwitchStatus.fav,
          categories: [],
          favoritesProducts: [],
          userSubscriptions: [],
          error: '',
        ));

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    if (event is ChangeFavoritesEvent) {
      yield* _mapChangeFavoritesEventToState(event);
    } else if (event is UploadFavoritesEvent) {
      yield* _mapUploadFavoritesEventToState(event);
    } else if (event is UploadSubscriptionsEvent) {
      yield* _mapUploadSubscriptionEventToState(event);
    } else if (event is OpenSubscribedUserProfileEvent) {
      yield state.copyWith(
        status: FavoritesStatus.normal,
        statusSwitch: FavoritesSwitchStatus.subUser,
        userSubId: event.userSubId,
      );
    }
  }

  Stream<FavoritesState> _mapUploadFavoritesEventToState(
    UploadFavoritesEvent event,
  ) async* {
    if (event.favoritesProducts.isEmpty) {
      yield state.copyWith(
        status: FavoritesStatus.loading,
        statusSwitch: FavoritesSwitchStatus.fav,
      );
    } else {
      yield state.copyWith(
        status: FavoritesStatus.normal,
        statusSwitch: FavoritesSwitchStatus.fav,
        favoritesProducts: event.favoritesProducts,
      );
    }
    List<ItemCategoryModel>? _categories;
    if (state.categories.isEmpty) {
      final categoriesEither = await dal.searchService.getCategoryList(
        cancelToken: event.cancelToken ?? CancelToken(),
      );
      yield* categoriesEither.fold(
        (failure) async* {
          if (failure is CancelledFailure) return;
          yield state.copyWith(
            status: FavoritesStatus.error,
            error: mapFailureToMessage(failure: failure),
          );
        },
        (cats) async* {
          _categories = cats;
        },
      );
    }

    final favoritesEither = await dal.favoritesService.getFavoritesProductsList(
      cancelToken: event.cancelToken ?? CancelToken(),
    );

    yield* favoritesEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;
        yield state.copyWith(
          status: FavoritesStatus.error,
          error: mapFailureToMessage(failure: failure),
        );
      },
      (favItems) async* {
        yield state.copyWith(
          status: favItems.isNotEmpty
              ? FavoritesStatus.normal
              : FavoritesStatus.isEmpty,
          statusSwitch: FavoritesSwitchStatus.fav,
          categories: _categories,
          favoritesProducts: favItems,
        );
      },
    );
  }

  Stream<FavoritesState> _mapUploadSubscriptionEventToState(
    UploadSubscriptionsEvent event,
  ) async* {
    if (event.userSubscriptions.isEmpty) {
      yield state.copyWith(
        status: FavoritesStatus.loading,
        statusSwitch: FavoritesSwitchStatus.sub,
      );
    } else {
      yield state.copyWith(
        status: FavoritesStatus.normal,
        statusSwitch: FavoritesSwitchStatus.sub,
        userSubscriptions: event.userSubscriptions,
      );
    }
    final favoritesEither = await dal.favoritesService.getUserSubscriptionList(
      cancelToken: event.cancelToken ?? CancelToken(),
    );
    yield* favoritesEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;
        yield state.copyWith(
          status: FavoritesStatus.error,
          error: mapFailureToMessage(failure: failure),
        );
      },
      (userSub) async* {
        yield state.copyWith(
          status: userSub.isNotEmpty
              ? FavoritesStatus.normal
              : FavoritesStatus.isEmpty,
          statusSwitch: FavoritesSwitchStatus.sub,
          userSubscriptions: userSub,
        );
      },
    );
  }

  Stream<FavoritesState> _mapChangeFavoritesEventToState(
    ChangeFavoritesEvent event,
  ) async* {
    final favoritesEither = await dal.favoritesService.favoritesRequest(
      productId: event.productId,
      cancelToken: event.cancelToken ?? CancelToken(),
    );
    yield* favoritesEither.fold(
      (failure) async* {
        AlertManager.showErrorDialog(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (response) async* {
        if (response == 'OK' || response == 'DELETED') {
          if (response == 'DELETED') {
            AlertManager.showShortToast(
              'Объявление удалено из избранного',
              seconds: 10,
              buttonText: 'Отмена',
              onPressed: () {
                event.favoritesBloc?.add(
                  ChangeFavoritesEvent(
                    productId: event.productId,
                    favoritesBloc: event.favoritesBloc,
                  ),
                );
              },
            );
          }
          if (response == 'OK') {
            AlertManager.showShortToast(
              'Объявление добавленно в избранное',
              buttonText: 'Отмена',
              onPressed: () async* {
                yield* _mapChangeFavoritesEventToState(ChangeFavoritesEvent(
                  productId: event.productId,
                ));
              },
            );
          }
          yield* _mapUploadFavoritesEventToState(UploadFavoritesEvent());
        } else {
          AlertManager.showShortToast(
            'Что-то пошло не так! Ответ => ' + response.toString(),
          );
        }
      },
    );
  }
}
