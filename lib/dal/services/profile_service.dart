part of '../dal.dart';

abstract class ProfileService {
  Future<Either<Failure, UserSimpleModel>> getUserById({
    required String userId,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, List<ReviewUserModel>>> getUserReviewsById({
    required String userId,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, List<Map<String, String>>>> getSubscribersIdById({
    required String userId,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, String>> addReview({
    required String userId,
    required String comment,
    int? value,
    required CancelToken cancelToken,
  });
}

class _ProfileService extends BasicService implements ProfileService {
  _ProfileService({required Dio dio}) : super(dio: dio);

  @override
  Future<Either<Failure, UserSimpleModel>> getUserById({
    required String userId,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/users/$userId',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => UserSimpleModel.fromJson(
          data.checkMapAndGet('result') as dynamic,
        ),
      );

  @override
  Future<Either<Failure, List<ReviewUserModel>>> getUserReviewsById({
    required String userId,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/user/$userId/reviews',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => data.checkListAndConvert(
          'result',
          (e) => ReviewUserModel.fromJson(e),
        ),
      );

  @override
  Future<Either<Failure, List<Map<String, String>>>> getSubscribersIdById({
    required String userId,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/user/$userId/subscribers',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => data.checkListAndConvert(
          'result',
          (e) => {'id': e['id']},
        ),
      );

  @override
  Future<Either<Failure, String>> addReview({
    required String userId,
    required String comment,
    int? value,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/user/add_review',
        method: HTTPRequestMethod.POST,
        body: {
          'user_id': userId,
          'comment': comment,
          'value': value,
        },
        cancelToken: cancelToken,
        converter: (data) => data.checkMapAndGet('result').toString(),
      );
}
