// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/utils/nullsafety.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

class PlayersParamsToParameterMapConverter
    extends Converter<PlayersParams, Map<String, String>> {
  final Logger _logger = getIt.get();

  @override
  Map<String, String> convert(PlayersParams input) {
    _logger.d('Converting PlayersParams object to parameter map...');
    _logger.v('input: $input');

    Map<String, String> params = {};
    params['includeAliases'] = 'true';

    ifNotNullDo<Set<String>>(input.ids, (ids) {
      params['userIds'] = ids.map((e) => e.trim()).join(',');
    });

    ifNotNullDo<Tuple2<bool, PlayerParamsSortField>>(input.sort, (sort) {
      var descChar = sort.item1 ? '-' : '';
      var value = sort.item2.value;

      params['sort'] = '$descChar$value';
    });

    ifNotNullDo<int>(input.minSubscriberCount, (minSubscriberCount) {
      params['minSubscribers'] = minSubscriberCount.toString();
    });

    ifNotNullDo<int>(input.maxSubscriberCount, (maxSubscriberCount) {
      params['maxSubscribers'] = maxSubscriberCount.toString();
    });

    ifNotNullDo<int>(input.minPlaytimeSeconds, (minPlaytimeSeconds) {
      params['minPlayTime'] = minPlaytimeSeconds.toString();
    });

    ifNotNullDo<int>(input.maxPlaytimeSeconds, (maxPlaytimeSeconds) {
      params['maxPlayTime'] = maxPlaytimeSeconds.toString();
    });

    ifNotNullDo<DateTime>(input.minDateJoined, (minDateJoined) {
      params['minCreatedAt'] = minDateJoined.toString();
    });

    ifNotNullDo<DateTime>(input.maxDateJoined, (maxDateJoined) {
      params['maxCreatedAt'] = maxDateJoined.toString();
    });

    return params;
  }
}
