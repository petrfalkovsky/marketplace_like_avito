// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension SearchStateCopyWith on SearchState {
  SearchState copyWith({
    List<ItemCategoryModel>? categories,
    ItemCategoryModel? currentCategory,
    String? error,
    bool? hasReachedMax,
    bool? isPaginating,
    List<ItemCategoryModel>? mainCategories,
    int? page,
    int? pagesCount,
    List<ProductItemModel>? products,
    String? search,
    SearchStatus? status,
  }) {
    return SearchState(
      categories: categories ?? this.categories,
      currentCategory: currentCategory ?? this.currentCategory,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isPaginating: isPaginating ?? this.isPaginating,
      mainCategories: mainCategories ?? this.mainCategories,
      page: page ?? this.page,
      pagesCount: pagesCount ?? this.pagesCount,
      products: products ?? this.products,
      search: search ?? this.search,
      status: status ?? this.status,
    );
  }

  SearchState copyWithNull({
    bool currentCategory = false,
  }) {
    return SearchState(
      categories: categories,
      currentCategory: currentCategory == true ? null : this.currentCategory,
      error: error,
      hasReachedMax: hasReachedMax,
      isPaginating: isPaginating,
      mainCategories: mainCategories,
      page: page,
      pagesCount: pagesCount,
      products: products,
      search: search,
      status: status,
    );
  }
}
