part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

// Меню в профиле
class MenuProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// Профиль пользователя
class MyUserProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// Мой объявления
class MyAdsEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// Мой отзывы
class MyReviewsEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// Мой заявки
class MyRequestsEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// Мой кошельки
class MyWalletsEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// Настройки
class SettingsEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

// Выход
class GoOutEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}







// class ChangeFavoritesEvent extends ProfileEvent {
//   final String productId;
//   final CancelToken? cancelToken;

//   ChangeFavoritesEvent({
//     required this.productId,
//     this.cancelToken,
//   });

//   @override
//   List<Object?> get props => [];
// }
