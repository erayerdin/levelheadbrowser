// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:levelheadbrowser/data/converters/players.dart';
import 'package:levelheadbrowser/data/converters/profile.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void setUpDI() async {
  getIt.registerLazySingleton(() => Logger());

  // Converters
  getIt.registerLazySingleton<Converter>(
    () => RumpusMapToProfileConverter(),
    instanceName: 'data.converters.profile.toProfile.fromRumpusMap',
  );
  getIt.registerLazySingleton<Converter>(
    () => PlayersParamsToParameterMapConverter(),
    instanceName: 'data.converters.players.toParamMap.fromPlayersParams',
  );
}
