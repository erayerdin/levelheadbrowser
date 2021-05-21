part of 'homepage_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageProfilesTabState implements HomePageState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class HomePageTowerTrialTabState implements HomePageState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class HomePageLevelsTabState implements HomePageState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class HomePageDailyBuildTabState implements HomePageState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
