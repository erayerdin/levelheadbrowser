// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/profiles.page.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

class ProfileFilterFormToPlayersParamsConverter extends Converter<
    Map<String, FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>,
    PlayersParams> {
  final Logger _logger = getIt.get();

  @override
  PlayersParams convert(
      Map<String, FormBuilderFieldState<FormBuilderField, dynamic>> input) {
    _logger.d('Converting form inputs to PlayersParams object...');

    var subscriberCountRange = input['subscriberCount']?.value as RangeValues;
    var minSubscriberCount = subscriberCountRange.start == SUBS_COUNT.item1
        ? null
        : subscriberCountRange.start.floor();
    var maxSubscriberCount = subscriberCountRange.end == SUBS_COUNT.item2
        ? null
        : subscriberCountRange.end.floor();

    var playtimeSecondsRange = input['playtimeSeconds']?.value as RangeValues;
    var minPlaytimeSeconds = playtimeSecondsRange.start == PLAYTIME_SECS.item1
        ? null
        : playtimeSecondsRange.start.floor();
    var maxPlaytimeSeconds = playtimeSecondsRange.end == PLAYTIME_SECS.item2
        ? null
        : playtimeSecondsRange.end.floor();

    var sortBy =
        input['sortBy']?.value as Tuple2<bool, PlayersParamsSortField>?;

    var params = PlayersParams(
      minSubscriberCount: minSubscriberCount,
      maxSubscriberCount: maxSubscriberCount,
      minPlaytimeSeconds: minPlaytimeSeconds,
      maxPlaytimeSeconds: maxPlaytimeSeconds,
      sort: sortBy,
    );

    return params;
  }
}
