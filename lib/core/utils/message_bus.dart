import 'dart:async';
import 'package:antares_market/core/index.dart';

class MessageBus {
  static MessageBus? _singleton;
  factory MessageBus() =>
      _singleton == null ? (_singleton = MessageBus._()) : _singleton!;

  MessageBus._({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  StreamController _streamController;
  StreamController get streamController => _streamController;

  final Map<dynamic, List> _subscribers = {};

  Stream<T> _on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void subscribe<T extends BaseEvent>(
    dynamic subscriber,
    void onData(T event),
  ) {
    if (!_subscribers.containsKey(subscriber)) {
      _subscribers[subscriber] = [];
    }
    final list = _subscribers[subscriber]!;
    if (list.any((e) => e is StreamSubscription<T>)) {
      throw Exception('The subscriber already contains this event');
    }

    final subscription = _on<T>().listen(onData);
    list.add(subscription);
  }

  void unsubscribe<T extends BaseEvent>(dynamic subscriber) {
    if (_subscribers.containsKey(subscriber)) {
      final list = _subscribers[subscriber]!;
      final StreamSubscription<T>? subscription =
          list.firstOrNull((e) => e is StreamSubscription<T>);
      if (subscription != null) {
        subscription.cancel();
        list.remove(subscription);
        if (list.isEmpty) {
          _subscribers.remove(subscriber);
        }
      }
    }
  }

  void send(dynamic event) {
    streamController.add(event);
  }

  void dispose() {
    _streamController.close();
  }
}

//events

abstract class BaseEvent {}

class SearchFilterUpdatedEvent extends BaseEvent {}

class LogoutEvent extends BaseEvent {}
