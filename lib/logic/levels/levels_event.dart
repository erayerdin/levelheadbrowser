part of 'levels_bloc.dart';

abstract class LevelsEvent extends Equatable {
  const LevelsEvent();

  @override
  List<Object> get props => [];
}

class LoadLevelsEvent implements LevelsEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
