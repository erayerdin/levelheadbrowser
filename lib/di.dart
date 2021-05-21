// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:levelheadbrowser/data/converters/players.dart';
import 'package:levelheadbrowser/data/converters/profile.dart';
import 'package:levelheadbrowser/data/providers/profile.dart';
import 'package:levelheadbrowser/data/repositories/profile.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void setUpDI() async {
  getIt.registerLazySingleton(() => Logger());
  getIt.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: 'https://www.bscotch.net/api/levelhead')),
    instanceName: 'http.client.rumpus',
  );

  // Converters
  getIt.registerLazySingleton<Converter>(
    () => RumpusMapToProfileConverter(),
    instanceName: 'data.converters.profile.toProfile.fromRumpusMap',
  );
  getIt.registerLazySingleton<Converter>(
    () => PlayersParamsToParameterMapConverter(),
    instanceName: 'data.converters.players.toParamMap.fromPlayersParams',
  );

  // Providers
  getIt.registerLazySingleton<ProfileProvider>(
    () => RumpusProfileProvider(),
    instanceName: 'data.providers.profile.rumpus',
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository>(
    () => RumpusProfileRepository(),
    instanceName: 'data.repositories.profile.rumpus',
  );
}
