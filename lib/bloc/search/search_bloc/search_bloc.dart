import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/core/services/app_preferences.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.g.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Dal dal;
  final AppStore appStore;

  SearchBloc({
    required this.dal,
    required this.appStore,
  }) : super(SearchState(
          status: SearchStatus.loading,
          categories: [],
          mainCategories: [],
          products: [],
          page: 0,
          pagesCount: 0,
          hasReachedMax: true,
        ));

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is OpenCategoryEvent) {
      yield* _mapOpenCategoryEventToState(event);
    } else if (event is FetchEvent) {
      yield* _mapFetchEventToState(event);
    }
  }

  Stream<SearchState> _mapOpenCategoryEventToState(
    OpenCategoryEvent event,
  ) async* {
    if (appStore.searchFilter.value == null) {
      appStore.searchFilter.push(SearchFilterModel(
        country: AppPreferences.userCountry,
        city: AppPreferences.userCity,
      ));
    } else if (state.currentCategory != event.category) {
      appStore.searchFilter.push(appStore.searchFilter.value!.copyWithNull(
        priceFrom: true,
        priceTo: true,
        sort: true,
        sortDestination: true,
      ));
    }

    yield state
        .copyWith(
          status: event.withFullScreenLoading ? SearchStatus.loading : null,
          currentCategory: event.category,
          search: event.search,
        )
        .copyWithNull(currentCategory: event.category == null);

    List<ItemCategoryModel>? newCategories;
    List<ItemCategoryModel>? newMainCategories;
    bool catsSuccess = true;
    if (state.categories.isEmpty) {
      final categoriesEither = await dal.searchService.getCategoryList(
        cancelToken: event.cancelToken ?? CancelToken(),
      );
      yield* categoriesEither.fold(
        (failure) async* {
          catsSuccess = false;
          event.completer?.complete();
          if (failure is CancelledFailure) return;
          yield state.copyWith(
            status: SearchStatus.error,
            error: mapFailureToMessage(failure: failure),
          );
        },
        (cats) async* {
          catsSuccess = true;
          newCategories = cats;
          newMainCategories = [];
          newCategories!.forEach((category) {
            if (category.showMain?.menu ?? false) {
              newMainCategories!.add(category);
            }
          });
        },
      );
    }

    if (!catsSuccess) {
      event.completer?.complete();
      return;
    }

    final countEither = await dal.searchService.getProductsPagesCount(
      categoryId: event.category?.id ?? '',
      search: event.search ?? '',
      filter: event.category == null ? null : appStore.searchFilter.value,
      cancelToken: event.cancelToken ?? CancelToken(),
    );
    yield* countEither.fold(
      (failure) async* {
        event.completer?.complete();
        if (failure is CancelledFailure) return;
        yield state.copyWith(
          status: SearchStatus.error,
          error: mapFailureToMessage(failure: failure),
        );
      },
      (pagesCount) async* {
        if (pagesCount == 0) {
          event.completer?.complete();
          yield state.copyWith(
            status: SearchStatus.normal,
            products: [],
            categories: newCategories ?? state.categories,
            mainCategories: newMainCategories ?? state.mainCategories,
            hasReachedMax: true,
            isPaginating: false,
            error: '',
            page: 0,
            pagesCount: 0,
          );
          return;
        }

        final productsEither = await dal.searchService.getProductsList(
          categoryId: event.category?.id ?? '',
          page: 0,
          search: event.search ?? '',
          filter: event.category == null ? null : appStore.searchFilter.value,
          cancelToken: event.cancelToken ?? CancelToken(),
        );

        event.completer?.complete();
        yield* productsEither.fold(
          (failure) async* {
            if (failure is CancelledFailure) return;
            yield state.copyWith(
              status: SearchStatus.error,
              error: mapFailureToMessage(failure: failure),
            );
          },
          (result) async* {
            yield state.copyWith(
              status: SearchStatus.normal,
              products: result,
              categories: newCategories ?? state.categories,
              mainCategories: newMainCategories ?? state.mainCategories,
              hasReachedMax: event.category == null ? true : pagesCount <= 1,
              isPaginating: false,
              error: '',
              page: 0,
              pagesCount: pagesCount,
            );
          },
        );
      },
    );
  }

  Stream<SearchState> _mapFetchEventToState(
    FetchEvent event,
  ) async* {
    if (state.hasReachedMax) return;
    yield state.copyWith(
      isPaginating: true,
    );

    final nextPage = state.page + 1;
    final productsEither = await dal.searchService.getProductsList(
      categoryId: state.currentCategory?.id ?? '',
      page: nextPage,
      filter: appStore.searchFilter.value,
      cancelToken: event.cancelToken ?? CancelToken(),
    );

    yield* productsEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;
        yield state.copyWith(
          status: SearchStatus.error,
          error: mapFailureToMessage(failure: failure),
          isPaginating: false,
        );
      },
      (result) async* {
        yield state.copyWith(
          status: SearchStatus.normal,
          products: [
            ...state.products,
            ...result,
          ],
          hasReachedMax: nextPage + 1 >= state.pagesCount,
          isPaginating: false,
          error: '',
          page: nextPage,
        );
      },
    );
  }
}
