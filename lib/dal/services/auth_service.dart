part of '../dal.dart';

abstract class AuthService {
  Future<Either<Failure, UserInfoModel>> userUpdateDataRequest({
    required CancelToken cancelToken,
  });

  Future<Either<Failure, UserInfoModel>> loginAttempt({
    required String email,
    required String password,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, UserInfoModel>> registerAttempt({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? cityId,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, bool>> resendEmail({
    required String email,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, bool>> recoveryEmail({
    required String email,
    required CancelToken cancelToken,
  });
}

class _AuthService extends BasicService implements AuthService {
  _AuthService({required Dio dio}) : super(dio: dio);

  @override
  Future<Either<Failure, UserInfoModel>> userUpdateDataRequest({
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/user/me',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => UserInfoModel.fromJson(
          data.checkMapAndGet('result') as dynamic,
        ),
      );

  @override
  Future<Either<Failure, UserInfoModel>> loginAttempt({
    required String email,
    required String password,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/auth/sign-in',
        method: HTTPRequestMethod.POST,
        body: {
          'email': email,
          'password': password,
        },
        cancelToken: cancelToken,
        converter: (data) => UserInfoModel.fromJson(
          data.checkMapAndGet('result') as dynamic,
        ),
      );

  @override
  Future<Either<Failure, UserInfoModel>> registerAttempt({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? cityId,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/auth/sign-up',
        method: HTTPRequestMethod.POST,
        body: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'city_id': cityId,
        },
        cancelToken: cancelToken,
        converter: (data) => UserInfoModel.fromJson(
          data.checkMapAndGet('result') as dynamic,
        ),
      );

  @override
  Future<Either<Failure, bool>> resendEmail({
    required String email,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/user/resend-email?email=$email',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => true,
      );

  @override
  Future<Either<Failure, bool>> recoveryEmail({
    required String email,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/auth/reset-password',
        method: HTTPRequestMethod.POST,
        body: {
          'email': email,
        },
        cancelToken: cancelToken,
        converter: (data) => true,
      );
}
