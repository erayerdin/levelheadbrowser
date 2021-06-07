part of 'homepage_bloc.dart';

abstract class HomePageState<T> extends Equatable {
  final T? params;

  const HomePageState(
    this.params,
  );

  @override
  List<Object> get props => [];
}

class HomePageProfilesTabState implements HomePageState<PlayersParams> {
  final PlayersParams? params;

  HomePageProfilesTabState(this.params);

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

  @override
  // TODO: implement params
  get params => throw UnimplementedError();
}

class HomePageLevelsTabState implements HomePageState<LevelsParams> {
  final LevelsParams? params;

  HomePageLevelsTabState(this.params);

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

  @override
  // TODO: implement params
  get params => throw UnimplementedError();
}
