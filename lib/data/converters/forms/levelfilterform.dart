// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/presentation/pages/levels/levels.page.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

class LevelFilterFormToLevelsParamsConverter extends Converter<
    Map<String, FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>,
    LevelsParams> {
  final Logger _logger = getIt.get();

  @override
  LevelsParams convert(
      Map<String, FormBuilderFieldState<FormBuilderField, dynamic>> input) {
    _logger.d('Converting form inputs to LevelsParams object...');

    var locations = input['locations']?.value == null
        ? []
        : input['locations']?.value as List<String>;
    var inTower = locations.contains('inTower');
    var inMarketingDepartment = locations.contains('inMarketingDepartment');
    var inDailyBuild = locations.contains('inDailyBuild');

    var playtimeSecondsRange = input['playtimeSeconds']?.value as RangeValues;
    var minPlaytimeSeconds = playtimeSecondsRange.start == PLAYTIME_SECS.item1
        ? null
        : playtimeSecondsRange.start.floor();
    var maxPlaytimeSeconds = playtimeSecondsRange.end == PLAYTIME_SECS.item2
        ? null
        : playtimeSecondsRange.end.floor();

    var exposureBucksRange = input['exposureBucks']?.value as RangeValues;
    var minExposureBucks = exposureBucksRange.start == BUCKS.item1
        ? null
        : exposureBucksRange.start.floor();
    var maxExposureBucks = exposureBucksRange.end == BUCKS.item2
        ? null
        : exposureBucksRange.end.floor();

    var replayCountRange = input['replayValue']?.value as RangeValues;
    var minReplayValue = replayCountRange.start == REPLAY.item1
        ? null
        : replayCountRange.start.floor();
    var maxReplayValue = replayCountRange.end == REPLAY.item2
        ? null
        : replayCountRange.end.floor();

    var sortBy = input['sortBy']?.value as Tuple2<bool, LevelsParamsSortField>?;

    var params = LevelsParams(
      inTower: inTower,
      inMarketingDepartment: inMarketingDepartment,
      inDailyBuild: inDailyBuild,
      minPlaytimeSeconds: minPlaytimeSeconds,
      maxPlaytimeSeconds: maxPlaytimeSeconds,
      minExposureBucks: minExposureBucks,
      maxExposureBucks: maxExposureBucks,
      minReplayValue: minReplayValue,
      maxReplayValue: maxReplayValue,
      sort: sortBy,
    );
    _logger.d('converted params: $params');
    return params;
  }
}
