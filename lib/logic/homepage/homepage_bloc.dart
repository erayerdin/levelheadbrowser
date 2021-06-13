import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/presentation/pages/home/home.page.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

extension HomePageBottomNavbarTabBlocExtension on HomePageBottomNavbarTab {
  HomePageState toState<T>(T? params) {
    switch (this) {
      case HomePageBottomNavbarTab.Profiles:
        return HomePageProfilesTabState(
          params == null ? PlayersParams() : params as PlayersParams,
        );
      case HomePageBottomNavbarTab.Levels:
        return HomePageLevelsTabState(
          params == null ? LevelsParams() : params as LevelsParams,
        );
      case HomePageBottomNavbarTab.TowerTrial:
        return HomePageTowerTrialTabState();
    }
  }
}

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageProfilesTabState(null));

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is LoadHomePageEvent) {
      yield HomePageBottomNavbarTab.values[event.index].toState(event.params);
    }
  }
}
