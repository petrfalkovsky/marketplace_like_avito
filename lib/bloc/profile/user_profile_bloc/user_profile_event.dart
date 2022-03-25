part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
}

class UserProfileOpenedEvent extends UserProfileEvent {
  final String userId;
  final CancelToken? cancelToken;

  UserProfileOpenedEvent({
    required this.userId,
    this.cancelToken,
  });

  @override
  List<Object?> get props => [
        userId,
        cancelToken,
      ];
}

class AddedReviewEvent extends UserProfileEvent {
  final String userId;
  final String comment;
  final int? value;
  final CancelToken? cancelToken;

  AddedReviewEvent({
    required this.userId,
    required this.comment,
    this.value,
    this.cancelToken,
  });

  @override
  List<Object?> get props => [
        userId,
        comment,
        value,
        cancelToken,
      ];
}
