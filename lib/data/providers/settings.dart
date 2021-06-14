// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hive/hive.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class SettingsProvider<ParamModel, ResponseType> {
  Future<ResponseType> get(ParamModel params);
}

class HiveSettingsProvider
    implements SettingsProvider<dynamic, Map<String, dynamic>> {
  final Logger _logger = getIt.get();
  final Future<Box> _box = getIt.getAsync(instanceName: 'hive.box.settings');

  @override
  Future<Map<String, dynamic>> get(params) async {
    _logger.d('Getting settings using Hive Settings Provder...');
    return (await _box).get('settings');
  }
}
