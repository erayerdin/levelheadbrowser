import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/data/repositories/settings.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Logger _logger = getIt.get();
  final SettingsRepository<dynamic, Settings> _repository =
      getIt.get(instanceName: 'data.repositories.settings.hive');
  late Settings _settings;
  Settings get settings => _settings;

  SettingsBloc() : super(LoadingSettingsState());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is LoadSettingsEvent) {
      Settings? settings = await _repository.get(null);

      if (settings == null) {
        _logger.w('No settings were found. Inıtıalizing new settings...');
        await _repository.update(INITIAL_SETTINGS);
        settings = await _repository.get(null);
      }

      _settings = settings!;

      yield LoadedSettingsState(settings: settings);
    } else if (event is UpdateSettingsEvent) {
      yield LoadingSettingsState();
      _repository.update(event.settings);
      _settings = event.settings;
      yield LoadedSettingsState(settings: _settings);
    }
  }
}
