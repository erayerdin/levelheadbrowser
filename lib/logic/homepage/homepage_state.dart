part of 'homepage_bloc.dart';

abstract class HomePageState<T> extends Equatable {
  final int index;
  final T? params;

  const HomePageState(
    this.index,
    this.params,
  );

  @override
  List<Object> get props => [];
}

class HomePageProfilesTabState implements HomePageState<PlayersParams> {
  final int index = 0;
  final PlayersParams? params;

  HomePageProfilesTabState(this.params);

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  String toString() => 'HomePageProfilesTabState(params: $params)';
}

class HomePageTowerTrialTabState implements HomePageState {
  final int index = 2;

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  // TODO: implement params
  get params => throw UnimplementedError();
}

class HomePageLevelsTabState implements HomePageState<LevelsParams> {
  final int index = 1;
  final LevelsParams? params;

  HomePageLevelsTabState(this.params);

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  String toString() => 'HomePageLevelsTabState(params: $params)';
}
