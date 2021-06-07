import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/presentation/pages/home/home.page.dart';
import 'package:logger/logger.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

extension HomePageBottomNavbarTabBlocExtension on HomePageBottomNavbarTab {
  HomePageState toState<T>(T? params) {
    switch (this) {
      case HomePageBottomNavbarTab.Profiles:
        return HomePageProfilesTabState(params as PlayersParams);
      case HomePageBottomNavbarTab.Levels:
        return HomePageLevelsTabState(params as LevelsParams);
      case HomePageBottomNavbarTab.TowerTrial:
        return HomePageTowerTrialTabState();
      case HomePageBottomNavbarTab.DailyBuild:
        return HomePageDailyBuildTabState();
    }
  }
}

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final Logger _logger = getIt.get();

  HomePageBloc() : super(HomePageProfilesTabState(null));

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is LoadHomePageEvent<PlayersParams>) {
      int index = event.index;

      yield HomePageBottomNavbarTab.values[index].toState(event.params);
    }
  }
}
