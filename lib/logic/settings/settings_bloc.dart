import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/di.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Box _box = getIt.get(instanceName: 'hive.settings');
  final Converter<Map, Settings> _fromMapToSettingsConverter =
      getIt.get(instanceName: 'data.converters.settings.toSettings.fromMap');
  final Converter<Settings, Map> _fromSettingsToMapConverter =
      getIt.get(instanceName: 'data.converters.settings.toMap.fromSettings');

  late Settings _settings;
  Settings get settings => _settings;

  SettingsBloc() : super(LoadingSettingsState());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is LoadSettingsEvent) {
      yield LoadingSettingsState();

      Settings? s = await _loadSettings();

      if (s == null) {
        add(SaveSettingsEvent(settings: DEFAULT_SETTINGS));
      } else {
        _settings = s;
        yield LoadedSettingsState(settings: s);
      }
    } else if (event is SaveSettingsEvent) {
      yield SavingSettingsState();
      _saveSettings(settings: event.settings);
      yield SavedSettingsState();
    }
  }

  Future<Settings?> _loadSettings() async {
    return _fromMapToSettingsConverter.convert(_box.get('settings'));
  }

  Future _saveSettings({required Settings settings}) async {
    _settings = settings;
  }

  @override
  Future<void> close() async {
    _box.put('settings', _fromSettingsToMapConverter.convert(_settings));
    return super.close();
  }
}
