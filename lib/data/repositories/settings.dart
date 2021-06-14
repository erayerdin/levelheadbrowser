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

abstract class SettingsRepository<ParamModel, LocalModel> {
  Future<LocalModel> get(ParamModel params);
}

class HiveSettingsRepository implements SettingsRepository<dynamic, Settings> {
  final Logger _logger = getIt.get();
  final SettingsProvider<dynamic, Map<String, dynamic>> _provider =
      getIt.get(instanceName: 'data.providers.settings.hive');
  final Converter<Map<String, dynamic>, Settings> _hiveMapToSettingsConverter =
      getIt.get(
          instanceName: 'data.converters.settings.toSettings.fromHiveMap');

  @override
  Future<Settings> get(params) async {
    _logger.d('Getting settings using Hive Settings Repository...');
    Map<String, dynamic> data = await _provider.get(params);
    return _hiveMapToSettingsConverter.convert(data);
  }
}
