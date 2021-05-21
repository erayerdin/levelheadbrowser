part of 'homepage_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class LoadHomePageEvent implements HomePageEvent {
  final int pageId;

  LoadHomePageEvent({
    required this.pageId,
  });

  @override
  List<Object> get props => [pageId];

  @override
  bool? get stringify => true;
}
