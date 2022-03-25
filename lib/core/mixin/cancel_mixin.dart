import 'package:antares_market/core/index.dart';
import 'package:dio/dio.dart';

mixin CancelMixin {
  CancelTokenSource _cancelTokenSource = CancelTokenSource();
  CancelTokenSource get cancelTokenSource => _cancelTokenSource;

  CancelToken cancel([dynamic reason]) {
    _cancelTokenSource.cancel(reason);
    _cancelTokenSource = CancelTokenSource();
    return _cancelTokenSource.token;
  }
}
