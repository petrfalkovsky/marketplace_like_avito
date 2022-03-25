part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GoToLoginEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class GoToRegisterEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class GoToRecoveryEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ConfirmEmailEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ResendEmailEvent extends LoginEvent {
  final String email;
  final CancelToken cancelToken;

  ResendEmailEvent({
    required this.email,
    required this.cancelToken,
  });

  @override
  List<Object?> get props => [email];
}

class LoginAttemptEvent extends LoginEvent {
  final String email;
  final String password;
  final CancelToken cancelToken;

  LoginAttemptEvent({
    required this.email,
    required this.password,
    required this.cancelToken,
  });

  @override
  List<Object> get props => [email, password];
}

class RecoveryAttemptEvent extends LoginEvent {
  final String email;
  final CancelToken cancelToken;

  RecoveryAttemptEvent({
    required this.email,
    required this.cancelToken,
  });
  @override
  List<Object> get props => [email];
}

class RegisterAttemptEvent extends LoginEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final CancelToken cancelToken;

  RegisterAttemptEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.cancelToken,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        password,
        rePassword,
      ];
}
