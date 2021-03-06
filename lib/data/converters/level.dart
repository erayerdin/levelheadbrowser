// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/models/record.dart';
import 'package:levelheadbrowser/data/repositories/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart' show Logger;

class RumpusMapToLevelConverter
    extends Converter<Map<String, dynamic>, Future<Level>> {
  final Logger _logger = getIt.get();
  final ProfileRepository<PlayersParams, Profile> _profileRepository =
      getIt.get(instanceName: 'data.repositories.profile.rumpus');

  Future<Set<Tag>> _buildTags(Map<String, dynamic> input) async {
    _logger.d('Building tags...');

    int tagCount = (input['tags'] as List).length;

    Set<Tag> tags = {};
    for (var i = 0; i < tagCount; i++) {
      tags.add(
        Tag(
          id: input['tags'][i],
          name: input['tagNames'][i],
        ),
      );
    }

    return tags;
  }

  Future<List<Record>> _buildRecords(
      Map<String, dynamic> input, bool isFastestTime) async {
    _logger.d('Building records...');
    _logger.v('is fastest time? $isFastestTime');

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
  Future<Level> convert(Map<String, dynamic> input) async {
    _logger.d('Converting Levelhead level data to Level object...');
    _logger.v('input: $input');

    return Level(
      id: input['levelId'],
      creator: await _profileRepository.getById(input['userId']),
      title: input['title'],
      createdAt: DateTime.parse(input['createdAt']),
      avatar: input['avatarId'],
      gameVersion: input['gameVersion'],
      inTower: input['tower'],
      inTowerTrial: input['towerTrial'],
      inDailyBuild: input['dailyBuild'],
      requiredPlayerCount: input['requiredPlayers'],
      creatorRecord: Duration(seconds: (input['creatorTime'] as num).floor()),
      tags: await _buildTags(input),
      content: LevelContent(
        worldContentCount: input['content']['World'],
        movementContentCount: input['content']['Movement'],
        puzzleContentCount: input['content']['Puzzles'],
        enemyContentCount: input['content']['Enemies'],
        hazardContentCount: input['content']['Hazards'],
      ),
      stats: LevelStats(
        attemptCount: input['stats']['Attempts'],
        diamondCount: input['stats']['Diamonds'],
        playerCount: input['stats']['Players'],
        successCount: input['stats']['Successes'],
        clearRate: input['stats']['ClearRate'],
        failureRate: input['stats']['FailureRate'],
        timePerWin: input['stats']['TimePerWin'],
        favoriteCount: input['stats']['Favorites'],
        likeCount: input['stats']['Likes'],
        playTimeSeconds: input['stats']['PlayTime'],
        replayValue: input['stats']['ReplayValue'],
        hiddenGemCount: input['stats']['HiddenGem'],
        exposureBucks: input['stats']['ExposureBucks'],
      ),
      highScoreRecords: await _buildRecords(input, false),
      fastestTimeRecords: await _buildRecords(input, true),
    );
  }
}
