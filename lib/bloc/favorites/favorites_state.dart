part of 'favorites_bloc.dart';

enum FavoritesStatus {
  loading,
  error,
  normal,
  isEmpty,
}

enum FavoritesSwitchStatus {
  fav,
  sub,
  subUser,
}

@CopyWith(generateCopyWithNull: true)
class FavoritesState extends Equatable {
  final FavoritesStatus status;
  final FavoritesSwitchStatus statusSwitch;
  final List<ItemCategoryModel> categories;
  final List<ProductItemModel> favoritesProducts;
  final List<UserSubscriptionModel> userSubscriptions;
  final String? userSubId;
  final String error;

  FavoritesState({
    required this.status,
    required this.statusSwitch,
    required this.categories,
    required this.favoritesProducts,
    required this.userSubscriptions,
    this.userSubId,
    this.error = '',
  });

  @override
  List<Object?> get props => [
        status,
        statusSwitch,
        categories,
        favoritesProducts,
        userSubscriptions,
        userSubId,
        error,
      ];
}
