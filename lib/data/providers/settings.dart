// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class SettingsProvider {
  Future<Map?> get settings;
  Future save({required Map data});
}

class LocalSettingsProvider implements SettingsProvider {
  final Logger _logger = getIt.get();
  final Future<Box> _box = getIt.getAsync(instanceName: 'hive.boxes.settings');

  @override
  Future<Map?> get settings async {
    _logger.d('Getting settings using LocalSettingsProvider...');
    var box = await _box;
    return box.get('settings');
  }

  @override
  Future save({required Map data}) async {
    _logger.d('Saving settings using LocalSettingsProvider...');
    _logger.d('data: $data');
    var box = await _box;
    box.put('settings', data);
  }
}
