part of 'homepage_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class LoadHomePageEvent<T> implements HomePageEvent {
  final int pageId;
  final T? params;

  LoadHomePageEvent({
    required this.pageId,
    this.params,
  });

  @override
  List<Object> get props => [pageId];

  @override
  bool? get stringify => true;
}
