part of 'user_profile_bloc.dart';

enum UserProfileStatus {
  loading,
  error,
  normal,
}

@CopyWith(generateCopyWithNull: true)
class UserProfileState extends Equatable {
  final UserProfileStatus status;
  final bool isMyProfile;
  final UserProfileInfoWidgetModel? userInfo;
  final List<ReviewUserModel>? reviewsUser;
  final RatingUserModel? userRaiting;
  final String error;
  UserProfileState({
    required this.status,
    this.isMyProfile = false,
    this.userInfo,
    this.reviewsUser,
    this.userRaiting,
    this.error = '',
  });

  @override
  List<Object?> get props => [
        status,
        isMyProfile,
        userInfo,
        reviewsUser,
        userRaiting,
        error,
      ];
}
