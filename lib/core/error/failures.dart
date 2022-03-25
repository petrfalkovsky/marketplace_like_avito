import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  final dynamic errors;

  ApiFailure({required this.errors});

  @override
  List<Object?> get props => [errors];
}

class CancelledFailure extends Failure {
  @override
  List<Object?> get props => [];
}
