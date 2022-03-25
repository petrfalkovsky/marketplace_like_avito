import 'package:antares_market/core/index.dart';

String mapFailureToMessage({required Failure failure}) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case NetworkFailure:
      return NETWORK_FAILURE_MESSAGE;
    case ApiFailure:
      return UNAUTHORIZED_FAILURE_MESSAGE;
    default:
      return UNEXPECTED_FAILURE_MESSAGE;
  }
}

List<String> mapFailureToMessageList({required Failure failure}) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return [SERVER_FAILURE_MESSAGE];
    case NetworkFailure:
      return [NETWORK_FAILURE_MESSAGE];
    case ApiFailure:
      var fail = failure as ApiFailure;
      List<String> errors = [];
      if (fail.errors == null) {
        errors.add(SERVER_FAILURE_MESSAGE);
      } else if (fail.errors is Map<String, dynamic>) {
        fail.errors.forEach((key, value) {
          List<dynamic> valueErrors = value;
          valueErrors.forEach((error) {
            errors.add(error.toString());
          });
        });
      } else if (fail.errors is List<String>) {
        errors.addAll(fail.errors);
      } else if (fail.errors is String) {
        errors.add(fail.errors);
      }
      return errors;
    default:
      return [UNEXPECTED_FAILURE_MESSAGE];
  }
}
