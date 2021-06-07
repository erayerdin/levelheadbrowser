import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

enum HomePageTab {
  Profiles,
  Levels,
  TowerTrial,
  DailyBuild,
}

HomePageTab fromIndexToHomePageTab(int index) {
  switch (index) {
    case 0:
      return HomePageTab.Profiles;
    case 1:
      return HomePageTab.Levels;
    case 2:
      return HomePageTab.TowerTrial;
    case 3:
      return HomePageTab.DailyBuild;
    default:
      return HomePageTab.Profiles;
  }
}

extension HomePageTabExtension on HomePageTab {
  HomePageState toState(dynamic params) {
    switch (this) {
      case HomePageTab.Profiles:
        return HomePageProfilesTabState();
      case HomePageTab.Levels:
        return HomePageLevelsTabState();
      case HomePageTab.TowerTrial:
        return HomePageTowerTrialTabState();
      case HomePageTab.DailyBuild:
        return HomePageDailyBuildTabState();
    }
  }
}

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final Logger _logger = getIt.get();

  HomePageBloc() : super(HomePageProfilesTabState());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is LoadHomePageEvent) {
      _logger.d('HomePageBloc event is LoadHomePageEvent.');
      int pageId = event.pageId;
      _logger.v('page id: $pageId');

      yield fromIndexToHomePageTab(pageId).toState(null);
    }
  }
}
