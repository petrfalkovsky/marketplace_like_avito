import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_profile_state.dart';
part 'user_profile_event.dart';
part 'user_profile_bloc.g.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final Dal dal;
  UserProfileBloc({
    required this.dal,
  }) : super(UserProfileState(
          status: UserProfileStatus.loading,
          error: '',
        ));

  @override
  Stream<UserProfileState> mapEventToState(
    UserProfileEvent event,
  ) async* {
    if (event is UserProfileOpenedEvent) {
      yield* _mapUserProfileOpenedEventToState(event);
    } else if (event is AddedReviewEvent) {
      yield* _mapAddedReviewEventToState(event);
    }
  }

  Stream<UserProfileState> _mapUserProfileOpenedEventToState(
    UserProfileOpenedEvent event,
  ) async* {
    final String userAccountId = AppPreferences.user?.id ?? '';

    if (userAccountId.isNotEmpty && event.userId == userAccountId) {
      yield state.copyWith(
        isMyProfile: true,
      );
    } else {
      yield state.copyWith(
        isMyProfile: false,
      );
    }

    final userSubscribersIdEither =
        await dal.profileService.getSubscribersIdById(
      userId: event.userId,
      cancelToken: event.cancelToken ?? CancelToken(),
    );

    final userEither = await dal.profileService.getUserById(
      userId: event.userId,
      cancelToken: event.cancelToken ?? CancelToken(),
    );

    yield* userEither.fold(
      (failure) async* {
        yield state.copyWith(
          status: UserProfileStatus.error,
          error: 'User:' + mapFailureToMessage(failure: failure),
        );
      },
      (userSimple) async* {
        yield* userSubscribersIdEither.fold(
          (failure) async* {
            yield state.copyWith(
              status: UserProfileStatus.error,
              error:
                  'UserSubscribersId:' + mapFailureToMessage(failure: failure),
            );
          },
          (usersSubId) async* {
            yield state.copyWith(
              status: UserProfileStatus.normal,
              userInfo: UserProfileInfoWidgetModel(
                userId: event.userId,
                avatarUrl: userSimple.avatar,
                userFullName: userSimple.firstName + ' ' + userSimple.lastName,
                createdAt: userSimple.createdAt,
                isVerified: userSimple.antares?.isVerified ?? false,
                countUserSubscribers: usersSubId.length,
              ),
            );
          },
        );
      },
    );

    final userReviewsEither = await dal.profileService.getUserReviewsById(
      userId: event.userId,
      cancelToken: event.cancelToken ?? CancelToken(),
    );

    yield* userReviewsEither.fold(
      (failure) async* {
        yield state.copyWith(
          status: UserProfileStatus.error,
          error: 'Reviews:' + mapFailureToMessage(failure: failure),
        );
      },
      (reviewsUserList) async* {
        final RatingUserModel userRaiting = RatingUserModel(
          reviewsUserList: reviewsUserList,
        );
        yield state.copyWith(
          reviewsUser: reviewsUserList,
          userRaiting: userRaiting,
        );
      },
    );
  }

  Stream<UserProfileState> _mapAddedReviewEventToState(
    AddedReviewEvent event,
  ) async* {
    final addReviewEither = await dal.profileService.addReview(
      userId: event.userId,
      comment: event.comment,
      cancelToken: event.cancelToken ?? CancelToken(),
    );

    yield* addReviewEither.fold((failure) async* {
      AlertManager.showErrorDialog(
        errors: ['Reviews Error: ' + mapFailureToMessage(failure: failure)],
      );
    }, (addedReview) async* {
      yield* _mapUserProfileOpenedEventToState(
        UserProfileOpenedEvent(userId: event.userId),
      );
      AlertManager.showShortToast(
        'Поздравляем, отзыв был оставлен.',
      );
    });
  }
}
