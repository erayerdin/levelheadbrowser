part of 'towertrials_bloc.dart';

abstract class TowerTrialsState extends Equatable {
  const TowerTrialsState();

  @override
  List<Object> get props => [];
}

class LoadingTowerTrialsState extends TowerTrialsState {}

class LoadedTowerTrialsState extends TowerTrialsState {
  final TowerTrial towerTrial;

  LoadedTowerTrialsState({
    required this.towerTrial,
  });

  @override
  List<Object> get props => [towerTrial];
}

class FailedLoadingTowerTrialsState extends TowerTrialsState {
  final String message;

  FailedLoadingTowerTrialsState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
