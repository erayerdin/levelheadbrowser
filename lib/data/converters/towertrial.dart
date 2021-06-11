// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/models/record.dart';
import 'package:levelheadbrowser/data/models/towertrial.dart';
import 'package:levelheadbrowser/data/repositories/level.dart';
import 'package:levelheadbrowser/data/repositories/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart' show Logger;

class RumpusMapToTowerTrialConverter
    extends Converter<Map<String, dynamic>, Future<TowerTrial>> {
  final Logger _logger = getIt.get();
  final LevelRepository<LevelsParams, Level> _levelRepository =
      getIt.get(instanceName: 'data.repositories.level.rumpus');
  final ProfileRepository<PlayersParams, Profile> _profileRepository =
      getIt.get(instanceName: 'data.repositories.profile.rumpus');

  Future<List<Level>> _buildLevels(Map<String, dynamic> input) async {
    _logger.d('Building levels...');

    List<String> levelIds = List.from(input['levelIds']);
    // REF https://stackoverflow.com/a/38016334/2926992
    List<Level> levels = await _levelRepository.list(
      LevelsParams(
        ids: levelIds.toSet(),
      ),
    );
    levels.sort((l1, l2) => levelIds.indexOf(l1.id) - levelIds.indexOf(l2.id));

    return levels;
  }

  Future<List<Record>> _buildRecords(
      Map<String, dynamic> input, bool isFastestTime) async {
    _logger.d('Building records...');

    List<Map<String, dynamic>> recordsData = isFastestTime
        ? List.from(input['records']['FastestTime'])
        : List.from(input['records']['HighScore']);

    List<Profile> profiles = await _profileRepository.list(
      PlayersParams(
        ids: recordsData.map((e) => e['userId'] as String).toSet(),
      ),
    );

    List<Record> records = recordsData
        .map(
          (e) => Record(
            profile:
                profiles.firstWhere((element) => element.id == e['userId']),
            createdAt: DateTime.parse(e['createdAt']),
            value: e['value'],
          ),
        )
        .toList();

    return records;
  }

  @override
  Future<TowerTrial> convert(Map<String, dynamic> input) async {
    _logger.d('Converting Levelhead tower trial data to TowerTrial object...');
    _logger.v('input: $input');

    return TowerTrial(
      createdAt: DateTime.parse(input['createdAt']),
      levels: await _buildLevels(input),
      fastestTimeRecords: await _buildRecords(input, true),
      highScoreRecords: await _buildRecords(input, false),
    );
  }
}
