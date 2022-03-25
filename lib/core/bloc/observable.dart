import 'dart:async';

class Observable<T> {
  final _controller = StreamController<T>.broadcast();
  T _value;

  Stream<T> get stream => _controller.stream;
  T get value => _value;

  Observable({required T value}) : _value = value;

  void push(
    T data, {
    bool pushEqualData = true,
  }) {
    if (!pushEqualData && data == _value) {
      _value = data;
      return;
    }
    _value = data;
    _controller.sink.add(data);
  }

  void notifyChanged() {
    _controller.add(_value);
  }

  void dispose() async {
    await _controller.close();
  }
}
