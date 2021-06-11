// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/params/towertrials.dart';
import 'package:levelheadbrowser/data/models/towertrial.dart';
import 'package:levelheadbrowser/data/providers/towertrial.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class TowerTrialRepository<ParamModel, LocalModel> {
  Future<LocalModel> today(ParamModel params);
}

class RumpusTowerTrialRepository
    implements TowerTrialRepository<TowerTrialsParams, TowerTrial> {
  final Logger _logger = getIt.get();
  final TowerTrialProvider<TowerTrialsParams, Map<String, dynamic>> _provider =
      getIt.get(instanceName: 'data.providers.towertrial.rumpus');
  final Converter<Map<String, dynamic>, Future<TowerTrial>> _converter =
      getIt.get(
    instanceName: 'data.converters.towertrial.toTowerTrial.fromRumpusMap',
  );

  @override
  Future<TowerTrial> today(TowerTrialsParams params) async {
    _logger.d(
        'Getting the tower trial of today using Rumpus Tower Trial Repository...');

    Map<String, dynamic> data = await _provider.today(TowerTrialsParams());
    TowerTrial towerTrial = await _converter.convert(data);
    _logger.v('tower trial: $towerTrial');

    return towerTrial;
  }
}
