part of 'levels_bloc.dart';

abstract class LevelsEvent extends Equatable {
  const LevelsEvent();

  @override
  List<Object> get props => [];
}

class LoadLevelsEvent implements LevelsEvent {
  final LevelsParams params;

  LoadLevelsEvent({
    required this.params,
  });

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
