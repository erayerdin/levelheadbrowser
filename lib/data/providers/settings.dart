// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hive/hive.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class SettingsProvider<T> {
  Future<T> load();
  Future save(T settings);
}

class LocalSettingsProvider extends SettingsProvider<Map?> {
  final Logger _logger = getIt.get();
  final Future<Box> _box = getIt.getAsync(instanceName: 'hive.boxes.settings');

  @override
  Future<Map?> load() async {
    _logger.d('Loading settings using LocalSettingsProvider...');
    return (await _box).get('settings');
  }

  @override
  Future save(Map? data) async {
    _logger.d('Saving settings using LocalSettingsProvider...');
    _logger.v('data: $data');
    await (await _box).put('settings', data);
  }
}

// class LocalSettingsProvider implements SettingsProvider {
//   final Logger _logger = getIt.get();
//   final Future<Box> _box = getIt.getAsync(instanceName: 'hive.boxes.settings');

//   @override
//   Future<Map?> get settings async {
//     _logger.d('Getting settings using LocalSettingsProvider...');
//     var box = await _box;
//     return box.get('settings');
//   }

//   @override
//   Future save({required Map data}) async {
//     _logger.d('Saving settings using LocalSettingsProvider...');
//     _logger.d('data: $data');
//     var box = await _box;
//     await box.put('settings', data);
//   }
// }
