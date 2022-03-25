// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension FavoritesStateCopyWith on FavoritesState {
  FavoritesState copyWith({
    List<ItemCategoryModel>? categories,
    String? error,
    List<ProductItemModel>? favoritesProducts,
    FavoritesStatus? status,
    FavoritesSwitchStatus? statusSwitch,
    String? userSubId,
    List<UserSubscriptionModel>? userSubscriptions,
  }) {
    return FavoritesState(
      categories: categories ?? this.categories,
      error: error ?? this.error,
      favoritesProducts: favoritesProducts ?? this.favoritesProducts,
      status: status ?? this.status,
      statusSwitch: statusSwitch ?? this.statusSwitch,
      userSubId: userSubId ?? this.userSubId,
      userSubscriptions: userSubscriptions ?? this.userSubscriptions,
    );
  }

  FavoritesState copyWithNull({
    bool userSubId = false,
  }) {
    return FavoritesState(
      categories: categories,
      error: error,
      favoritesProducts: favoritesProducts,
      status: status,
      statusSwitch: statusSwitch,
      userSubId: userSubId == true ? null : this.userSubId,
      userSubscriptions: userSubscriptions,
    );
  }
}
