part of 'towertrials_bloc.dart';

abstract class TowerTrialsEvent extends Equatable {
  const TowerTrialsEvent();

  @override
  List<Object> get props => [];
}

class LoadTowerTrialsEvent implements TowerTrialsEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
