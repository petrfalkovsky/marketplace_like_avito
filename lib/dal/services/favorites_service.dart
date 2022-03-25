part of '../dal.dart';

abstract class FavoritesService {
  Future<Either<Failure, List<ProductItemModel>>> getFavoritesProductsList({
    required CancelToken cancelToken,
  });

  Future<Either<Failure, List<UserSubscriptionModel>>> getUserSubscriptionList({
    required CancelToken cancelToken,
  });

  Future<Either<Failure, String>> favoritesRequest({
    required String productId,
    required CancelToken cancelToken,
  });
}

class _FavoritesService extends BasicService implements FavoritesService {
  _FavoritesService({required Dio dio}) : super(dio: dio);

  @override
  Future<Either<Failure, List<ProductItemModel>>> getFavoritesProductsList({
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/favorites',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => data.checkListAndConvert(
          'result',
          (e) {
            FavoriteItemModel _fav = FavoriteItemModel.fromJson(e['product']);
            List<PhotoModel> _photosFilenames = [];
            _fav.photosFilenames.forEach((foto) {
              _photosFilenames.add(
                PhotoModel(
                  original:
                      'https://antares.market/api/images/product/original/$foto',
                  oneHundred:
                      'https://antares.market/api/images/product/100x100/$foto',
                  twoHundred:
                      'https://antares.market/api/images/product/200x200/$foto',
                  fiveHundred:
                      'https://antares.market/api/images/product/500x500/$foto',
                ),
              );
            });
            return ProductItemModel(
              id: _fav.id,
              title: _fav.title,
              uri: _fav.uri,
              description: _fav.description,
              category: _fav.category,
              userSeller: _fav.userSeller,
              status: _fav.status,
              countViews: _fav.countViews,
              usdPrice: _fav.usdPrice,
              prices: _fav.prices,
              photosFilenames: _photosFilenames,
              created: _fav.created,
              city: CityModel(
                id: _fav.city ?? '',
                name: '',
                uri: '',
              ),
            );
          },
        ),
      );

  @override
  Future<Either<Failure, List<UserSubscriptionModel>>> getUserSubscriptionList({
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/user/subscribes',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => data.checkListAndConvert(
          'result',
          (e) => UserSubscriptionModel.fromJson(e),
        ),
      );

  @override
  Future<Either<Failure, String>> favoritesRequest({
    required String productId,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/favorites',
        method: HTTPRequestMethod.PUT,
        cancelToken: cancelToken,
        body: {
          'product': productId,
        },
        converter: (data) => data.checkMapAndGet('result').toString(),
      );
}
