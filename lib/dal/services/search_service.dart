part of '../dal.dart';

const _PAGE_CAPACITY = 22;

abstract class SearchService {
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({
    required String uri,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, List<ItemCategoryModel>>> getCategoryList({
    required CancelToken cancelToken,
  });

  Future<Either<Failure, int>> getProductsPagesCount({
    required String categoryId,
    String search = '',
    SearchFilterModel? filter,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, List<ProductItemModel>>> getProductsList({
    required String categoryId,
    required int page,
    String search = '',
    SearchFilterModel? filter,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, ItemOrderModel>> openItemOrder({
    required String productId,
    required CancelToken cancelToken,
  });

  Future<Either<Failure, String>> chooseCurrency({
    required String orderId,
    required String returnAddress,
    required String currency,
    required CancelToken cancelToken,
  });
}

class _SearchService extends BasicService implements SearchService {
  _SearchService({required Dio dio}) : super(dio: dio);

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({
    required String uri,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/products/$uri/info',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => ProductDetailsModel.fromJson(
          data.checkMapAndGet('result') as Map<String, dynamic>,
        ),
      );

  @override
  Future<Either<Failure, List<ItemCategoryModel>>> getCategoryList({
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/categories',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) {
          return data.checkListAndConvert(
            'result',
            (e) => ItemCategoryModel.fromJson(e),
          );
        },
      );

  @override
  Future<Either<Failure, int>> getProductsPagesCount({
    required String categoryId,
    String search = '',
    SearchFilterModel? filter,
    required CancelToken cancelToken,
  }) async {
    var pagesCount = 0;

    final countResult = await invokeHttpRequest<int>(
      path: '/api/v1/products/count',
      method: HTTPRequestMethod.GET,
      cancelToken: cancelToken,
      queryParameters: {
        'category_id': categoryId,
        'search': search,
        'country': filter?.country?.id,
        'city': filter?.city?.id,
        'sort': filter?.sort ?? 'date',
        'sort_destination': filter?.sortDestination ?? 'desc',
        if (filter?.priceFrom != null) 'prices[from]': filter!.priceFrom,
        if (filter?.priceTo != null) 'prices[to]': filter!.priceTo,
      },
      converter: (data) =>
          data.checkMapAndGet('result').checkMapAndGet('count') as int,
    );

    return countResult.fold(
      (failure) => Left(failure),
      (count) {
        if (count % _PAGE_CAPACITY == 0) {
          pagesCount = count ~/ _PAGE_CAPACITY;
        } else {
          pagesCount = (count ~/ _PAGE_CAPACITY) + 1;
        }
        return Right(pagesCount);
      },
    );
  }

  @override
  Future<Either<Failure, List<ProductItemModel>>> getProductsList({
    required String categoryId,
    required int page,
    String search = '',
    SearchFilterModel? filter,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/products',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        queryParameters: {
          'category_id': categoryId,
          'country': filter?.country?.id,
          'city': filter?.city?.id,
          'search': search,
          'count': _PAGE_CAPACITY,
          'offset': _PAGE_CAPACITY * page,
          'sort': filter?.sort ?? 'date',
          'sort_destination': filter?.sortDestination ?? 'desc',
          if (filter?.priceFrom != null) 'prices[from]': filter!.priceFrom,
          if (filter?.priceTo != null) 'prices[to]': filter!.priceTo,
        },
        converter: (data) => data.checkListAndConvert(
          'result',
          (e) => ProductItemModel.fromJson(e),
        ),
      );

  @override
  Future<Either<Failure, ItemOrderModel>> openItemOrder({
    required String productId,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/order/$productId/open',
        method: HTTPRequestMethod.GET,
        cancelToken: cancelToken,
        converter: (data) => ItemOrderModel.fromJson(
          data.checkMapAndGet('result') as Map<String, dynamic>,
        ),
      );

  @override
  Future<Either<Failure, String>> chooseCurrency({
    required String orderId,
    required String returnAddress,
    required String currency,
    required CancelToken cancelToken,
  }) =>
      invokeHttpRequest(
        path: '/api/v1/order/$orderId/generate-address/currency',
        method: HTTPRequestMethod.GET,
        queryParameters: {
          'return_address': returnAddress,
        },
        cancelToken: cancelToken,
        converter: (data) => data.checkMapAndGet('result') as String,
      );
}
