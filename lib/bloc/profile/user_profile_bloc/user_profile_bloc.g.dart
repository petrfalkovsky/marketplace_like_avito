// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserProfileStateCopyWith on UserProfileState {
  UserProfileState copyWith({
    String? error,
    bool? isMyProfile,
    List<ReviewUserModel>? reviewsUser,
    UserProfileStatus? status,
    UserProfileInfoWidgetModel? userInfo,
    RatingUserModel? userRaiting,
  }) {
    return UserProfileState(
      error: error ?? this.error,
      isMyProfile: isMyProfile ?? this.isMyProfile,
      reviewsUser: reviewsUser ?? this.reviewsUser,
      status: status ?? this.status,
      userInfo: userInfo ?? this.userInfo,
      userRaiting: userRaiting ?? this.userRaiting,
    );
  }

  UserProfileState copyWithNull({
    bool reviewsUser = false,
    bool userInfo = false,
    bool userRaiting = false,
  }) {
    return UserProfileState(
      error: error,
      isMyProfile: isMyProfile,
      reviewsUser: reviewsUser == true ? null : this.reviewsUser,
      status: status,
      userInfo: userInfo == true ? null : this.userInfo,
      userRaiting: userRaiting == true ? null : this.userRaiting,
    );
  }
}
