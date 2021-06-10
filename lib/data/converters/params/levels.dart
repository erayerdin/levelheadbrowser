// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/utils/nullsafety.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

class LevelsParamsToParameterMapConverter
    extends Converter<LevelsParams, Map<String, String>> {
  final Logger _logger = getIt.get();

  @override
  Map<String, String> convert(LevelsParams input) {
    _logger.d('Converting LevelsParams object to parameter map...');
    _logger.v('input: $input');

    Map<String, String> params = {};
    params['includeStats'] = 'true';
    params['includeRecords'] = 'true';

    ifNotNullDo<Set<String>>(input.ids, (ids) {
      params['levelIds'] = ids.map((e) => e.trim()).join(',');
    });

    ifNotNullDo<Tuple2<bool, LevelsParamsSortField>>(input.sort, (sort) {
      var descChar = sort.item1 ? '' : '-';
      var value = sort.item2.value;

      params['sort'] = '$descChar$value';
    });

    // TODO limit

    ifNotNullDo<Set<String>>(input.tags, (tags) {
      params['tags'] = tags.map((e) => e.trim()).join(',');
    });

    ifNotNullDo<DateTime>((input.minCreatedAt), (minCreatedAt) {
      params['minCreatedAt'] = minCreatedAt.toString();
    });

    ifNotNullDo<DateTime>((input.maxCreatedAt), (maxCreatedAt) {
      params['maxCreatedAt'] = maxCreatedAt.toString();
    });

    ifNotNullDo<bool>(input.inTower, (inTower) {
      if (inTower) params['tower'] = '$inTower';
    });

    ifNotNullDo<bool>(input.inMarketingDepartment, (inMarketingDepartment) {
      if (inMarketingDepartment) params['marketing'] = '$inMarketingDepartment';
    });

    ifNotNullDo<bool>(input.inDailyBuild, (inDailyBuild) {
      if (inDailyBuild) params['dailyBuild'] = '$inDailyBuild';
    });

    ifNotNullDo<int>(input.minPlaytimeSeconds, (minPlaytimeSeconds) {
      params['minPlayTime'] = minPlaytimeSeconds.toString();
    });

    ifNotNullDo<int>(input.maxPlaytimeSeconds, (maxPlaytimeSeconds) {
      params['maxPlayTime'] = maxPlaytimeSeconds.toString();
    });

    ifNotNullDo<int>(input.minExposureBucks, (minExposureBucks) {
      params['minExposureBucks'] = minExposureBucks.toString();
    });

    ifNotNullDo<int>(input.maxExposureBucks, (maxExposureBucks) {
      params['maxExposureBucks'] = maxExposureBucks.toString();
    });

    ifNotNullDo<int>(input.minReplayValue, (minReplayValue) {
      params['minReplayValue'] = minReplayValue.toString();
    });

    ifNotNullDo<int>(input.maxReplayValue, (maxReplayValue) {
      params['maxReplayValue'] = maxReplayValue.toString();
    });

    ifNotNullDo<int>(input.minHiddenGemCount, (minHiddenGemCount) {
      params['minHiddenGem'] = minHiddenGemCount.toString();
    });

    ifNotNullDo<int>(input.maxHiddenGemCount, (maxHiddenGemCount) {
      params['maxHiddenGem'] = maxHiddenGemCount.toString();
    });

    ifNotNullDo<int>(input.minDiamondCount, (minDiamondCount) {
      params['minDiamonds'] = minDiamondCount.toString();
    });

    ifNotNullDo<int>(input.maxDiamondCount, (maxDiamondCount) {
      params['maxDiamons'] = maxDiamondCount.toString();
    });

    _logger.v('Levels GET params: $params');
    return params;
  }
}
