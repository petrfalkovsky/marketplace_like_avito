part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class UploadFavoritesEvent extends FavoritesEvent {
  final List<ProductItemModel> favoritesProducts;
  final CancelToken? cancelToken;

  UploadFavoritesEvent({
    this.favoritesProducts = const [],
    this.cancelToken,
  });

  @override
  List<Object?> get props => [];
}

class UploadSubscriptionsEvent extends FavoritesEvent {
  final List<UserSubscriptionModel> userSubscriptions;
  final CancelToken? cancelToken;

  UploadSubscriptionsEvent({
    this.userSubscriptions = const [],
    this.cancelToken,
  });
  @override
  List<Object?> get props => [];
}

class ChangeFavoritesEvent extends FavoritesEvent {
  final String productId;
  final CancelToken? cancelToken;
  final FavoritesBloc? favoritesBloc;

  ChangeFavoritesEvent({
    required this.productId,
    this.cancelToken,
    this.favoritesBloc,
  });

  @override
  List<Object?> get props => [];
}

class OpenSubscribedUserProfileEvent extends FavoritesEvent {
  final String userSubId;
  final CancelToken? cancelToken;
  OpenSubscribedUserProfileEvent({
    required this.userSubId,
    this.cancelToken,
  });

  @override
  List<Object?> get props => [];
}
