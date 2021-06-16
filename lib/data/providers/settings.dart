// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hive/hive.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class SettingsProvider<ParamModel, Type> {
  Future<Type> get(ParamModel params);
  Future<void> update(Type instance);
}

class HiveSettingsProvider
    implements SettingsProvider<dynamic, Map<String, dynamic>> {
  static const BOX_KEY = 'settings';
  final Logger _logger = getIt.get();
  final Future<Box> _box = getIt.getAsync(instanceName: 'hive.box.settings');

  @override
  Future<Map<String, dynamic>> get(params) async {
    _logger.d('Getting settings using Hive Settings Provder...');
    return (await _box).get(BOX_KEY);
  }

  @override
  Future<void> update(Map<String, dynamic> instance) async {
    _logger.d('Updating settings using Hive Settings Provider...');
    await (await _box).put(BOX_KEY, instance);
  }
}
