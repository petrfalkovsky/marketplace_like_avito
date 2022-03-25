import 'package:dio/dio.dart';

class CancelTokenSource {
  CancelToken _token;
  CancelTokenSource() : _token = CancelToken();
  CancelToken get token => _token;

  void cancel([dynamic reason]) {
    if (!_token.isCancelled) _token.cancel(reason);
  }
}

extension CancelTokenExt on CancelToken {
  static CancelToken get none => CancelToken();
}
