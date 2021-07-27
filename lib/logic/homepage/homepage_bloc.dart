import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/logic/deeplink/deeplink_cubit.dart';
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
  final DeepLinkCubit _deepLinkCubit;
  late StreamSubscription _deepLinkCubitSub;

  HomePageBloc(
    this._deepLinkCubit,
  ) : super(HomePageProfilesTabState(null)) {
    _deepLinkCubitSub = _deepLinkCubit.stream.listen((uri) {
      // TODO implement URI to event converter
    });
  }

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is LoadHomePageEvent) {
      yield HomePageBottomNavbarTab.values[event.index].toState(event.params);
    }
  }

  @override
  Future<void> close() {
    _deepLinkCubitSub.cancel();
    return super.close();
  }
}
