part of '../../dal.dart';

class HTTPRequestMethod {
  HTTPRequestMethod._();

  static const GET = 'GET';
  static const POST = 'POST';
  static const DELETE = 'DELETE';
  static const PUT = 'PUT';
}

abstract class BasicService {
  final Dio dio;

  BasicService({required this.dio});

  Future<Either<Failure, T>> invokeHttpRequest<T>({
    String host = BASE_URL,
    required String path,
    required String method,
    required CancelToken cancelToken,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    T Function(Object data)? converter,
    Map<String, String> Function()? dynamicHeaders,
    ResponseType? responseType,
    bool useApiFailureBuilder = true,
    ValidateStatus? validateStatus,
  }) async {
    Response response;
    try {
      response = await _dioRequest(
        path: path,
        method: method,
        body: body,
        host: host,
        queryParameters: queryParameters,
        headers: dynamicHeaders?.call(),
        responseType: responseType,
        cancelToken: cancelToken,
        validateStatus: validateStatus,
      );
    } on DioError catch (error) {
      print("Ошибка в basic_service.dart onDioError => " + error.toString());
      _printResponse(error.response);

      //Если отменено
      if (error.type == DioErrorType.cancel) return Left(CancelledFailure());

      //Ответ не получен
      if (error.response?.statusCode == null) return Left(NetworkFailure());

      //Ошибка возвращена в api в json и невалидным статус кодом
      if (useApiFailureBuilder && error.response != null) {
        return Left(
          ApiFailure(
            errors: (error.response!.data as Object).checkMapAndGet('error'),
          ),
        );
      }

      return Left(ServerFailure());
    } catch (error) {
      print("Ошибка в basic_service.dart catchError => " + error.toString());
      return Left(NetworkFailure());
    }

    if (converter != null) {
      try {
        final data = converter(response.data ?? Object());
        return Right(data);
      } catch (e) {
        return Left(ServerFailure());
      }
    }

    return Right(response.data);
  }

  Future<Response<dynamic>> _dioRequest({
    required String host,
    required String path,
    required String method,
    required CancelToken cancelToken,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    ResponseType? responseType,
    ValidateStatus? validateStatus,
  }) async {
    //check network for avoid long reconnects
    var connectivityResult = await getIt<Connectivity>().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('Device does\'not connected to network');
    }

    final url = _createURL(host, path);
    String bodyJson = '';
    try {
      bodyJson = jsonEncode(body);
      if (bodyJson.length > 2000) {
        bodyJson = bodyJson.substring(0, 2000);
      }
    } catch (e) {}
    String queryJson = '';
    try {
      queryJson = jsonEncode(queryParameters);
      if (queryJson.length > 2000) {
        queryJson = bodyJson.substring(0, 2000);
      }
    } catch (e) {}

    print('==========');
    print(
        '[${DateTime.now().toIso8601String()}] HTTP ${method.toString()} Request');
    print('URL: $url');
    print('Body: $bodyJson');
    print('Query parameters: $queryJson');
    print('Headers: $headers');

    final result = await dio.request(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        method: method,
        responseType: responseType,
        validateStatus: validateStatus ??
            (status) {
              return status == 200;
            },
      ),
      cancelToken: cancelToken,
    );

    _printResponse(result);

    return result;
  }

  void _printResponse(Response? response) {
    String responseJson = '';
    try {
      responseJson = jsonEncode(response?.data);
      if (responseJson.length > 2000) {
        responseJson = responseJson.substring(0, 2000);
      }
    } catch (e) {}

    print('[${DateTime.now().toIso8601String()}] HTTP Result');
    print('Status code: ${response?.statusCode}');
    print('Data: $responseJson');
    print('==========');
  }

  static String _createURL(
    String host,
    String path,
  ) {
    final url = path.startsWith('/') ? path.substring(1) : path;
    host = _purifyHostAddress(host);

    return Uri(
      scheme: 'https',
      host: host,
      path: url,
    ).toString();
  }

  static String _purifyHostAddress(String host) {
    if (host.isEmpty) return '';
    var hostRegExp = RegExp(r'^http(s)?://');
    host = host.replaceAll(hostRegExp, '');

    if (host.endsWith('/')) {
      host = host.substring(0, host.length - 1);
    }

    return host;
  }
}
