import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:antares_market/dal/models/index.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.g.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Dal dal;
  ProfileBloc({
    required this.dal,
  }) : super(ProfileState(
          status: ProfileStatus.loading,
          switcher: ProfileSwitcher.menu,
          error: '',
        ));

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is MenuProfileEvent) {
      yield* _mapMenuProfileEventToState(event);
    } else if (event is MyUserProfileEvent) {
      yield* _mapMyUserProfileEventToState(event);
    } else if (event is MyAdsEvent) {
      yield* _mapMyAdsEventToState(event);
    } else if (event is MyReviewsEvent) {
      yield* _mapMyReviewsEventToState(event);
    } else if (event is MyRequestsEvent) {
      yield* _mapMyRequestsEventToState(event);
    } else if (event is MyWalletsEvent) {
      yield* _mapMyWalletsEventToState(event);
    } else if (event is SettingsEvent) {
      yield* _mapSettingsEventToState(event);
    } else if (event is GoOutEvent) {
      yield* _mapGoOutEventToState(event);
    }
  }

  Stream<ProfileState> _mapMenuProfileEventToState(
    MenuProfileEvent event,
  ) async* {
    yield state.copyWith(
      status: ProfileStatus.loading,
    );
    final user = AppPreferences.user;
    if (user == null) {
      final userUpdatedDataEither = await dal.authService.userUpdateDataRequest(
        cancelToken: CancelToken(),
      );
      yield* userUpdatedDataEither.fold((failure) async* {
        yield state.copyWith(
          status: ProfileStatus.error,
          error: mapFailureToMessage(failure: failure),
        );
      }, (userUpdatedData) async* {
        await SessionController.auth(userUpdatedData);
      });
    } else {
      yield state.copyWith(
        status: ProfileStatus.normal,
        switcher: ProfileSwitcher.menu,
        user: user,
      );

      /// TODO: Think about this
      /*final userUpdatedDataEither = await dal.authService.userUpdateDataRequest(
        cancelToken: CancelToken(),
      );
      yield* userUpdatedDataEither.fold((failure) async* {
        yield state.copyWith(
          status: ProfileStatus.error,
          error: mapFailureToMessage(failure: failure),
        );
      }, (userUpdatedData) async* {
        await SessionController.auth(userUpdatedData);

        yield state.copyWith(
          status: ProfileStatus.normal,
          switcher: ProfileSwitcher.menu,
          user: userUpdatedData,
        );
      });*/
    }
  }

  Stream<ProfileState> _mapMyUserProfileEventToState(
    MyUserProfileEvent event,
  ) async* {
    yield state.copyWith(
      status: ProfileStatus.normal,
      switcher: ProfileSwitcher.profile,
    );
  }

  Stream<ProfileState> _mapMyAdsEventToState(MyAdsEvent event) async* {
    yield state.copyWith(
      status: ProfileStatus.normal,
      switcher: ProfileSwitcher.ads,
    );
  }

  Stream<ProfileState> _mapMyReviewsEventToState(MyReviewsEvent event) async* {
    yield state.copyWith(
      status: ProfileStatus.normal,
      switcher: ProfileSwitcher.reviews,
    );
  }

  Stream<ProfileState> _mapMyRequestsEventToState(
      MyRequestsEvent event) async* {
    yield state.copyWith(
      status: ProfileStatus.normal,
      switcher: ProfileSwitcher.requests,
    );
  }

  Stream<ProfileState> _mapMyWalletsEventToState(MyWalletsEvent event) async* {
    yield state.copyWith(
      status: ProfileStatus.normal,
      switcher: ProfileSwitcher.wallets,
    );
  }

  Stream<ProfileState> _mapSettingsEventToState(SettingsEvent event) async* {
    yield state.copyWith(
      status: ProfileStatus.normal,
      switcher: ProfileSwitcher.settings,
    );
  }

  Stream<ProfileState> _mapGoOutEventToState(ProfileEvent event) async* {
    yield state.copyWith(
      status: ProfileStatus.normal,
      switcher: ProfileSwitcher.logout,
    );
  }
}
