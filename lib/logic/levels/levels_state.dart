part of 'levels_bloc.dart';

abstract class LevelsState extends Equatable {
  const LevelsState();

  @override
  List<Object> get props => [];
}

class LoadingLevelsState extends LevelsState {}

class LoadedLevelsState extends LevelsState {
  final List<Level> levels;

  LoadedLevelsState({
    required this.levels,
  });

  @override
  List<Object> get props => [levels];

  @override
  String toString() => 'LoadedLevelsState(levels: $levels)';
}

class FailedLoadingLevelsState extends LevelsState {
  final String message;

  FailedLoadingLevelsState({
    required this.message,
  });

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'FailedLoadingLevelsState(message: $message)';
}
