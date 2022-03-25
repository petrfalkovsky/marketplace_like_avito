part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class LoadingItemEvent extends ItemEvent {
  @override
  List<Object?> get props => [];
}

class GetItemEvent extends ItemEvent {
  final String uri;

  GetItemEvent({required this.uri});

  @override
  List<Object?> get props => [uri];
}

class AddPreviousItemEvent extends ItemEvent {
  final ProductItemModel item;

  AddPreviousItemEvent({required this.item});

  @override
  List<Object?> get props => [item];
}
