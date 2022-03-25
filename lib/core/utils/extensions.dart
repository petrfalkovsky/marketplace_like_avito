import 'dart:math';

import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return this;

    return '${this[0].toUpperCase()}${this.substring(1)}';
  }

  String take(int count) {
    if (this.isEmpty) return this;

    final max = min(this.length, count);
    return this.substring(0, max);
  }
}

extension ObjectExtension on Object {
  T? asCast<T>() {
    if (this is T) {
      return this as T;
    }
    return null;
  }

  Object checkMapAndGet(Object key) {
    final map = this.asCast<Map>();
    if (map != null && map.containsKey(key)) {
      return map[key];
    }
    return Object();
  }

  List<T> checkListAndConvert<T>(Object key, T f(e)) {
    return this.checkMapAndGet(key).asCast<List>()?.map(f).toList() ?? [];
  }
}

extension IterableExtension<T> on Iterable<T> {
  T? firstOrNull([bool test(T element)?]) {
    if (test == null) test = (e) => true;
    try {
      return this.firstWhere(test);
    } catch (e) {
      return null;
    }
  }

  T? lastOrNull([bool test(T element)?]) {
    if (test == null) test = (e) => true;
    try {
      return this.lastWhere(test);
    } catch (e) {
      return null;
    }
  }

  Map<S, List<T>> groupBy<S>(S Function(T element) key) {
    final map = <S, List<T>>{};
    for (final element in this) {
      (map[key(element)] ??= []).add(element);
    }
    return map;
  }

  List<T> get distinct => this.toSet().toList();

  Iterable<T> distinctBy<S>(S Function(T element) key) {
    final map = <S, T>{};
    for (final element in this) {
      final keyValue = key(element);
      if (!map.containsKey(keyValue)) {
        map[keyValue] = element;
      }
    }
    return map.values;
  }
}

extension DateTimeExtension on DateTime {
  DateTime onlyDate() {
    return DateTime(this.year, this.month, this.day);
  }

  DateTime onlyDateUtc() {
    return DateTime.utc(this.year, this.month, this.day);
  }

  String dayName() {
    return DateFormat.E(Intl.getCurrentLocale()).format(this);
  }
}
