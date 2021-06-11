import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/params/towertrials.dart';
import 'package:levelheadbrowser/data/models/towertrial.dart';
import 'package:levelheadbrowser/data/repositories/towertrial.dart';
import 'package:levelheadbrowser/di.dart';

part 'towertrials_event.dart';
part 'towertrials_state.dart';

class TowerTrialsBloc extends Bloc<TowerTrialsEvent, TowerTrialsState> {
  final TowerTrialRepository<TowerTrialsParams, TowerTrial> _repository =
      getIt.get(
    instanceName: 'data.repositories.towertrial.rumpus',
  );

  TowerTrialsBloc() : super(LoadingTowerTrialsState());

  @override
  Stream<TowerTrialsState> mapEventToState(
    TowerTrialsEvent event,
  ) async* {
    if (event is LoadTowerTrialsEvent) {
      yield LoadingTowerTrialsState();

      try {
        TowerTrial towerTrial = await _repository.today(TowerTrialsParams());
        yield LoadedTowerTrialsState(towerTrial: towerTrial);
      } on DioError catch (e, stacktrace) {
        addError(e, stacktrace);
        yield FailedLoadingTowerTrialsState(
          message: 'An error occured while connecting to Rumpus service.',
        );
      } catch (e, stacktrace) {
        addError(e, stacktrace);
        yield FailedLoadingTowerTrialsState(
          message: 'An unknown error occured.',
        );
      }
    }
  }
}
