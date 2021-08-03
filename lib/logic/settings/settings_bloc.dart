import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/data/repositories/settings.dart';
import 'package:levelheadbrowser/di.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _repository =
      getIt.get(instanceName: 'data.repositories.settings.local');

  SettingsBloc() : super(LoadingSettingsState());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is LoadSettingsEvent) {
      yield LoadingSettingsState();
      yield LoadedSettingsState(settings: await _repository.settings);
    } else if (event is SaveSettingsEvent) {
      yield SavingSettingsState();
      _repository.settings = Future.value(event.settings);
      yield SavedSettingsState();
      yield LoadedSettingsState(settings: await _repository.settings);
    }
  }

  @override
  Future<void> close() async {
    _repository.save(settings: await _repository.settings);
    return super.close();
  }
}
