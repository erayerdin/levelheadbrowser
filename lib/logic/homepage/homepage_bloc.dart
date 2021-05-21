import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

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

      switch (pageId) {
        case 0:
          yield HomePageProfilesTabState();
          break;
        case 1:
          yield HomePageTowerTrialTabState();
          break;
        case 2:
          yield HomePageLevelsTabState();
          break;
        case 3:
          yield HomePageDailyBuildTabState();
          break;
        default:
          yield HomePageProfilesTabState();
          break;
      }
    }
  }
}
