// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/providers/level.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart' show Logger;

abstract class LevelRepository<ParamModel, LocalModel> {
  Future<List<LocalModel>> list(ParamModel params);
}

class RumpusLevelRepository implements LevelRepository<LevelsParams, Level> {
  final Logger _logger = getIt.get();
  final LevelProvider<LevelsParams, Map<String, dynamic>> _provider =
      getIt.get(instanceName: 'data.providers.level.rumpus');
  final Converter<Map<String, dynamic>, Future<Level>> _converter =
      getIt.get(instanceName: 'data.converters.level.toLevel.fromRumpusMap');

  @override
  Future<List<Level>> list(LevelsParams params) async {
    _logger.d('Getting level list using Rumpus Level Repository...');
    _logger.v('params: $params');

    List<Map<String, dynamic>> data = await _provider.list(params);

    List<Level> levels = [];
    for (var levelData in data) {
      levels.add(await _converter.convert(levelData));
    }
    _logger.v('levels: $levels');

    return levels;
  }
}
