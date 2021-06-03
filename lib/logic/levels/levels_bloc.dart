import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/repositories/level.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart' show Logger;

part 'levels_event.dart';
part 'levels_state.dart';

class LevelsBloc extends Bloc<LevelsEvent, LevelsState> {
  final Logger _logger = getIt.get();
  final LevelRepository<LevelsParams, Level> _repository =
      getIt.get(instanceName: 'data.repositories.level.rumpus');

  LevelsBloc() : super(LoadingLevelsState());

  @override
  Stream<LevelsState> mapEventToState(
    LevelsEvent event,
  ) async* {
    if (event is LoadLevelsEvent) {
      _logger.d('LevelsBloc event is LoadLevelsEvent.');

      _logger.d('LevelsBloc state is LoadingLevelsState.');
      yield LoadingLevelsState();

      try {
        List<Level> levels = await _repository.list(LevelsParams());
        _logger.d('LevelsBloc state is LoadedLevelsState.');
        yield LoadedLevelsState(levels: levels);
      } on DioError catch (e, stacktrace) {
        _logger.d('LevelsBloc state is FailedLoadingLevelsState.');
        _logger.e(e);
        _logger.e(stacktrace);
        yield FailedLoadingLevelsState(
            message: 'An error occured while connecting to Rumpus service.');
      } catch (e, stacktrace) {
        _logger.d('ProfilesBloc state is FailedProfileState.');
        _logger.e(e);
        _logger.e(stacktrace);
        yield FailedLoadingLevelsState(message: 'An unknown error occured.');
      }
    }
  }
}
