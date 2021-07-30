// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/data/providers/settings.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class SettingsRepository {
  Future<Settings> get settings;
  Future save({required Settings settings});
}

class LocalSettingsRepository implements SettingsRepository {
  final Logger _logger = getIt.get();
  final SettingsProvider _provider =
      getIt.get(instanceName: 'data.providers.settings.local');
  final Converter<Settings, Map> _toMapConverter =
      getIt.get(instanceName: 'data.converters.settings.toMap.fromSettings');
  final Converter<Map, Settings> _toSettingsConverter =
      getIt.get(instanceName: 'data.converters.settings.toSettings.fromMap');

  Settings? _settings;

  @override
  Future<Settings> get settings async {
    _logger.d('Getting settings using LocalSettingsRepository...');

    if (_settings != null) {
      _logger.d('Getting settings from memory...');
      return _settings!;
    }

    var settingsData = await _provider.settings;
    if (settingsData == null) {
      _logger.w('Creating new default settings...');
      await save(settings: DEFAULT_SETTINGS);
      settingsData = await _provider.settings;
    }

    return _toSettingsConverter.convert(settingsData!);
  }

  @override
  Future save({required Settings settings}) async {
    _provider.save(data: _toMapConverter.convert(settings));
  }
}
