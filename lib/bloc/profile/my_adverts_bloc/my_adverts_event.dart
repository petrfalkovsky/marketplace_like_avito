part of 'my_adverts_bloc.dart';

abstract class MyAdvertsEvent extends Equatable {
  const MyAdvertsEvent();
}

class OpenMyAdvertsEvent extends MyAdvertsEvent {
  OpenMyAdvertsEvent();

  @override
  List<Object?> get props => [];
}
