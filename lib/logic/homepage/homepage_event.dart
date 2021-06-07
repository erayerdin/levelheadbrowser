part of 'homepage_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class LoadHomePageEvent<T> implements HomePageEvent {
  final int index;
  final T? params;

  LoadHomePageEvent({
    required this.index,
    this.params,
  });

  @override
  List<Object> get props => [index];

  @override
  bool? get stringify => true;
}
