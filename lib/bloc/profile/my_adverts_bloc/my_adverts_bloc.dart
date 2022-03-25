import 'dart:async';

import 'package:antares_market/dal/dal.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_adverts_state.dart';
part 'my_adverts_event.dart';

class MyAdvertsBloc extends Bloc<MyAdvertsEvent, MyAdvertsState> {
  final Dal dal;
  MyAdvertsBloc({
    required this.dal,
  }) : super(MyAdvertsState());

  @override
  Stream<MyAdvertsState> mapEventToState(MyAdvertsEvent event) async* {}
}
