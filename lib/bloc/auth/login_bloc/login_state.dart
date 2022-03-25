part of 'login_bloc.dart';

enum LoginStatus {
  login,
  register,
  recovery,
  recoveryEmail,
  confirmEmail,
}

@CopyWith()
class LoginState extends Equatable {
  final LoginStatus status;

  const LoginState({
    required this.status,
  });

  @override
  List<Object?> get props => [
        status,
      ];
}
