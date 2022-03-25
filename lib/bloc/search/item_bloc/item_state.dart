part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();
}

class ItemInitial extends ItemState {
  @override
  List<Object?> get props => [];
}

class LoadingItemState extends ItemState {
  @override
  List<Object?> get props => [];
}

class ErrorItemState extends ItemState {
  final String error;

  ErrorItemState({required this.error});

  @override
  List<Object?> get props => [error];
}

class GetItemState extends ItemState {
  final ProductDetailsModel productDetails;
  final List<ProductItemModel> previousItems;

  GetItemState({
    required this.productDetails,
    required this.previousItems,
  });

  @override
  List<Object?> get props => [
        productDetails,
        previousItems,
      ];
}
