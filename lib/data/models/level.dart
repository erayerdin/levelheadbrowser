// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:equatable/equatable.dart';

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/models/record.dart';

class Tag extends Equatable {
  final String id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id];
}

class LevelContent {
  final int worldContentCount;
  final int movementContentCount;
  final int puzzleContentCount;
  final int enemyContentCount;
  final int hazardContentCount;

  LevelContent({
    required this.worldContentCount,
    required this.movementContentCount,
    required this.puzzleContentCount,
    required this.enemyContentCount,
    required this.hazardContentCount,
  });
}

class LevelStats {
  final int attemptCount;
  final int diamondCount;
  final int playerCount;
  final int successCount;
  final num clearRate;
  final num failureRate;
  final num? timePerWin;
  final int? favoriteCount;
  final int? likeCount;
  final int playTimeSeconds;
  final int replayValue;
  final int hiddenGemCount;
  final int exposureBucks;

  LevelStats({
    required this.attemptCount,
    required this.diamondCount,
    required this.playerCount,
    required this.successCount,
    required this.clearRate,
    required this.failureRate,
    required this.timePerWin,
    required this.favoriteCount,
    required this.likeCount,
    required this.playTimeSeconds,
    required this.replayValue,
    required this.hiddenGemCount,
    required this.exposureBucks,
  });
}

class Level extends Equatable {
  final String id;
  final Profile creator;
  final String title;
  final DateTime createdAt;
  final String avatar;
  final String gameVersion;
  final bool inTower;
  final bool inTowerTrial;
  final bool inDailyBuild;
  final int requiredPlayerCount;
  final Duration creatorRecord;
  final Set<Tag> tags;
  final LevelContent content;
  final LevelStats stats;
  final List<Record> highScoreRecords;
  final List<Record> fastestTimeRecords;

  Level({
    required this.id,
    required this.creator,
    required this.title,
    required this.createdAt,
    required this.avatar,
    required this.gameVersion,
    required this.inTower,
    required this.inTowerTrial,
    required this.inDailyBuild,
    required this.requiredPlayerCount,
    required this.creatorRecord,
    required this.tags,
    required this.content,
    required this.stats,
    required this.highScoreRecords,
    required this.fastestTimeRecords,
  });

  String getAvatarURL({int height = 50, bool isWebP = true}) =>
      'https://img.bscotch.net/fit-in/${height}x$height/avatars/$avatar.${isWebP ? "webp" : "png"}';

  @override
  List<Object?> get props => [id];
}
