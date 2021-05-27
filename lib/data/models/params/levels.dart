// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:tuple/tuple.dart';

enum LevelsParamsSortField {
  CreatedAt,
  PlaytimeSeconds,
  ReplayValue,
  ExposureBucks,
  HiddenGemCount,
}

extension LevelsParamsSortFieldExtension on LevelsParamsSortField {
  String get value {
    switch (this) {
      case LevelsParamsSortField.CreatedAt:
        return 'createdAt';
      case LevelsParamsSortField.PlaytimeSeconds:
        return 'PlayTime';
      case LevelsParamsSortField.ReplayValue:
        return 'ReplayValue';
      case LevelsParamsSortField.ExposureBucks:
        return 'ExposureBucks';
      case LevelsParamsSortField.HiddenGemCount:
        return 'HiddenGem';
    }
  }
}

class LevelsParams {
  final Set<String>? ids;
  final Tuple2<bool, LevelsParamsSortField>? sort;
  final int? limit;
  final Set<String>? userIds;
  final Set<String>? tags;
  final DateTime? minCreatedAt;
  final DateTime? maxCreatedAt;
  final bool? inTower;
  final bool? inMarketingDepartment;
  final bool? inDailyBuild;
  final int? minPlaytimeSeconds;
  final int? maxPlaytimeSeconds;
  final int? minExposureBucks;
  final int? maxExposureBucks;
  final int? minReplayValue;
  final int? maxReplayValue;
  final int? minHiddenGemCount;
  final int? maxHiddenGemCount;
  final int? minDiamondCount;
  final int? maxDiamondCount;

  LevelsParams({
    this.ids,
    this.sort,
    this.limit,
    this.userIds,
    this.tags,
    this.minCreatedAt,
    this.maxCreatedAt,
    this.inTower,
    this.inMarketingDepartment,
    this.inDailyBuild,
    this.minPlaytimeSeconds,
    this.maxPlaytimeSeconds,
    this.minExposureBucks,
    this.maxExposureBucks,
    this.minReplayValue,
    this.maxReplayValue,
    this.minHiddenGemCount,
    this.maxHiddenGemCount,
    this.minDiamondCount,
    this.maxDiamondCount,
  });
  // TODO add minSecondsAgo, ref: https://www.bscotch.net/api/docs/levelhead/#levels-level-search-get
}
