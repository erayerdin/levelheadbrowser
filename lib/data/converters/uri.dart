// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:logger/logger.dart';

class UriToLoadHomePageEventConverter
    extends Converter<Uri?, LoadHomePageEvent?> {
  final Logger _logger = getIt.get();

  @override
  LoadHomePageEvent? convert(Uri? input) {
    if (input == null) {
      return null;
    }

    _logger.d('Converting URI to LoadHomePageEvent...');
    _logger.v('uri: $input');

    var host = input.host;
    var paths = input.pathSegments;

    _logger.v('host: $host');
    _logger.v('paths: $paths');

    if (paths.length == 0) {
      return null;
    }

    var id = paths[0];
    _logger.v('id: $id');

    LoadHomePageEvent event;
    switch (host) {
      case 'profile':
        event = LoadHomePageEvent(
          index: 0,
          params: PlayersParams(ids: {id}),
        );
        break;
      case 'level':
        event = LoadHomePageEvent(
          index: 1,
          params: LevelsParams(ids: {id}),
        );
        break;
      default:
        return null;
    }

    _logger.v('event: $event');
    return event;
  }
}
