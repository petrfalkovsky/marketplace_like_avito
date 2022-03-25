part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class OpenCategoryEvent extends SearchEvent {
  final ItemCategoryModel? category;
  final bool withFullScreenLoading;
  final String? search;
  final Completer? completer;
  final CancelToken? cancelToken;

  OpenCategoryEvent({
    required this.category,
    required this.search,
    this.withFullScreenLoading = true,
    this.completer,
    this.cancelToken,
  });

  @override
  List<Object?> get props => [
        category,
        withFullScreenLoading,
        search,
      ];
}

class FetchEvent extends SearchEvent {
  final CancelToken? cancelToken;

  const FetchEvent({
    this.cancelToken,
  });

  @override
  List<Object?> get props => [];
}
