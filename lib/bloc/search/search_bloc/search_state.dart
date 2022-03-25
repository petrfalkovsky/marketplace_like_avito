part of 'search_bloc.dart';

enum SearchStatus { loading, error, normal }

@CopyWith(generateCopyWithNull: true)
class SearchState extends Equatable {
  final SearchStatus status;
  final List<ProductItemModel> products;
  final List<ItemCategoryModel> categories;
  final List<ItemCategoryModel> mainCategories;
  final ItemCategoryModel? currentCategory;
  final String search;
  final int pagesCount;
  final int page;
  final bool hasReachedMax;
  final bool isPaginating;
  final String error;

  bool get isMainPage => currentCategory == null;

  const SearchState({
    required this.status,
    required this.products,
    required this.categories,
    required this.mainCategories,
    this.currentCategory,
    this.search = '',
    this.pagesCount = 0,
    this.page = 0,
    this.hasReachedMax = false,
    this.isPaginating = false,
    this.error = '',
  });

  @override
  List<Object?> get props => [
        status,
        products,
        categories,
        mainCategories,
        pagesCount,
        currentCategory,
        search,
        page,
        hasReachedMax,
        isPaginating,
        error,
      ];
}
