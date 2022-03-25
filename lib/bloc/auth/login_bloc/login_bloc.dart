import 'dart:async';

import 'package:antares_market/core/index.dart';
import 'package:antares_market/dal/dal.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get/route_manager.dart';

part 'login_bloc.g.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dal dal;

  LoginBloc({
    required this.dal,
  }) : super(LoginState(
          status: LoginStatus.login,
        ));

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is GoToLoginEvent) {
      yield state.copyWith(status: LoginStatus.login);
    } else if (event is GoToRegisterEvent) {
      yield state.copyWith(status: LoginStatus.register);
    } else if (event is GoToRecoveryEvent) {
      yield state.copyWith(status: LoginStatus.recovery);
    } else if (event is ConfirmEmailEvent) {
      yield state.copyWith(status: LoginStatus.confirmEmail);
    } else if (event is LoginAttemptEvent) {
      yield* _mapLoginAttemptEventToState(event);
    } else if (event is RecoveryAttemptEvent) {
      yield* _mapRecoveryAttemptEventToState(event);
    } else if (event is RegisterAttemptEvent) {
      yield* _mapRegisterAttemptEventToState(event);
    } else if (event is ResendEmailEvent) {
      yield* _mapResendEmailAttemptEventToState(event);
    }
  }

  // Попытка входа в аккаунт
  Stream<LoginState> _mapLoginAttemptEventToState(
    LoginAttemptEvent event,
  ) async* {
    await AlertManager.showProgress();
    final loginEither = await dal.authService.loginAttempt(
      email: event.email,
      password: event.password,
      cancelToken: event.cancelToken,
    );
    await AlertManager.hideProgress();

    yield* loginEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;
        AlertManager.showErrorDialog(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (user) async* {
        await SessionController.auth(user);
        if (user.emailIsConfirmed) {
          Get.back();
        } else {
          yield state.copyWith(
            status: LoginStatus.confirmEmail,
          );
        }

        // SessionController.checkAccess(
        //   emailNotConfirmed: () async* {
        //     yield state.copyWith(
        //       status: LoginStatus.confirmEmail,
        //     );
        //   },
        //   fullAccess: () {
        //     Get.back();
        //   },
        // );
      },
    );
  }

  // Попытка регистрации аккаунта
  Stream<LoginState> _mapRegisterAttemptEventToState(
    RegisterAttemptEvent event,
  ) async* {
    await AlertManager.showProgress();
    final registerEither = await dal.authService.registerAttempt(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      password: event.password,
      cancelToken: event.cancelToken,
    );
    await AlertManager.hideProgress();

    yield* registerEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;

        AlertManager.showErrorDialog(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (user) async* {
        await SessionController.auth(user);

        yield state.copyWith(
          status: LoginStatus.confirmEmail,
        );

        // SessionController.checkAccess(
        //   emailNotConfirmed: () async* {
        //     yield state.copyWith(
        //       status: LoginStatus.confirmEmail,
        //     );
        //   },
        //   fullAccess: () {
        //     Get.back();
        //   },
        // );
      },
    );
  }

  // Попытка востановления аккаунта
  Stream<LoginState> _mapRecoveryAttemptEventToState(
    RecoveryAttemptEvent event,
  ) async* {
    await AlertManager.showProgress();
    final recoveryEither = await dal.authService.recoveryEmail(
      email: event.email,
      cancelToken: event.cancelToken,
    );

    await AlertManager.hideProgress();

    yield* recoveryEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;

        AlertManager.showErrorDialog(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (user) async* {
        yield state.copyWith(
          status: LoginStatus.recoveryEmail,
        );
      },
    );

    // yield state.copyWith(
    //   status: LoginStatus.recoveryEmail,
    // );
  }

  Stream<LoginState> _mapResendEmailAttemptEventToState(
    ResendEmailEvent event,
  ) async* {
    await AlertManager.showProgress();
    final resendEither = await dal.authService.resendEmail(
      email: event.email,
      cancelToken: event.cancelToken,
    );

    await AlertManager.hideProgress();
    yield* resendEither.fold(
      (failure) async* {
        if (failure is CancelledFailure) return;

        AlertManager.showErrorDialog(
          errors: mapFailureToMessageList(failure: failure),
        );
      },
      (user) async* {
        yield state.copyWith(
          status: LoginStatus.confirmEmail,
        );
      },
    );
  }
}
