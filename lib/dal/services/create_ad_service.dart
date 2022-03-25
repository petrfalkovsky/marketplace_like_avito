part of '../dal.dart';

abstract class CreateAdService {
  Future<Either<Failure, dynamic>> createAdRequest({
    required String title,
    required String usdPrice,
    required String subCategoryId,
    required String cityId,
    required String description,
    required String phone,
    required List<String> photosFilenames,
    required List<PricesToCreateAdModel> prices,
    // required List<dynamic> prices,
    required List<PropertiesToCreateAdModel> properties,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, UploadedPhotoDataModel>> uploadImage({
    required FormData formData,
    required CancelToken cancelToken,
  });
}

class _CreateAdService extends BasicService implements CreateAdService {
  _CreateAdService({required Dio dio}) : super(dio: dio);

  @override
  Future<Either<Failure, dynamic>> createAdRequest({
    required String title,
    required String usdPrice,
    required String subCategoryId,
    required String cityId,
    required String description,
    required String phone,
    required List<String> photosFilenames,
    required List<PricesToCreateAdModel> prices,
    // required List<dynamic> prices,
    required List<PropertiesToCreateAdModel> properties,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/products',
        method: HTTPRequestMethod.POST,
        cancelToken: cancelToken,
        body: {
          'title': title,
          'usd_price': usdPrice,
          'category_id': subCategoryId,
          'city_id': cityId,
          'description': description,
          'phone': phone,
          'photos_filenames': photosFilenames,
          'prices': prices,
          'properties': properties,
        },
        converter: (data) => data.checkMapAndGet('result'),
      );

  @override
  Future<Either<Failure, UploadedPhotoDataModel>> uploadImage({
    required FormData formData,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/products/photo',
        method: HTTPRequestMethod.POST,
        body: formData,
        dynamicHeaders: () {
          return {
            'accept': '*/*',
            'Content-Type': 'multipart/form-data',
          };
        },
        cancelToken: cancelToken,
        converter: (data) => UploadedPhotoDataModel.fromJson(
            data.checkMapAndGet('result') as dynamic),
      );
}
