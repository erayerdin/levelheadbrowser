// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:levelheadbrowser/data/converters/forms/profilefilterform.dart';
import 'package:levelheadbrowser/data/converters/level.dart';
import 'package:levelheadbrowser/data/converters/params/levels.dart';
import 'package:levelheadbrowser/data/converters/params/players.dart';
import 'package:levelheadbrowser/data/converters/profile.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/providers/level.dart';
import 'package:levelheadbrowser/data/providers/profile.dart';
import 'package:levelheadbrowser/data/repositories/profile.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setUpDI() async {
  getIt.registerLazySingleton(() => Logger());

  // HTTP
  getIt.registerSingletonAsync<CacheStore>(
    () async => HiveCacheStore(
      (await getApplicationDocumentsDirectory()).path,
    ),
    instanceName: 'http.client.cache.store',
    signalsReady: false,
  );
  getIt.registerLazySingleton(
    () => CacheOptions(
      store: getIt.get(instanceName: 'http.client.cache.store'),
      maxStale: Duration(minutes: 30),
    ),
    instanceName: 'http.client.cache.options',
  );
  getIt.registerLazySingleton<Interceptor>(
    () => DioCacheInterceptor(
      options: getIt.get(instanceName: 'http.client.cache.options'),
    ),
    instanceName: 'http.client.cache.interceptor',
  );
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(baseUrl: 'https://www.bscotch.net/api/levelhead'),
    )..interceptors.add(
        getIt.get(instanceName: 'http.client.cache.interceptor'),
      ),
    instanceName: 'http.client.rumpus',
  );

  // Converters
  getIt.registerLazySingleton<Converter<Map<String, dynamic>, Profile>>(
    () => RumpusMapToProfileConverter(),
    instanceName: 'data.converters.profile.toProfile.fromRumpusMap',
  );
  // TODO Converter<Map<String, dynamic>, Future<Level>> does not work.
  getIt.registerLazySingleton<Converter>(
    () => RumpusMapToLevelConverter(),
    instanceName: 'data.converters.level.toLevel.fromRumpusMap',
  );
  getIt.registerLazySingleton<Converter<PlayersParams, Map<String, String>>>(
    () => PlayersParamsToParameterMapConverter(),
    instanceName: 'data.converters.players.toParamMap.fromPlayersParams',
  );
  getIt.registerLazySingleton<Converter<LevelsParams, Map<String, String>>>(
    () => LevelsParamsToParameterMapConverter(),
    instanceName: 'data.converters.players.toParamMap.fromLevelsParams',
  );
  getIt.registerLazySingleton<
      Converter<
          Map<String,
              FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>,
          PlayersParams>>(
    () => ProfileFilterFormToPlayersParamsConverter(),
    instanceName: 'data.converters.forms.fromProfileFilterForm.toPlayersParams',
  );

  // Providers
  getIt.registerLazySingleton<
      ProfileProvider<PlayersParams, Map<String, dynamic>>>(
    () => RumpusProfileProvider(),
    instanceName: 'data.providers.profile.rumpus',
  );
  getIt
      .registerLazySingleton<LevelProvider<LevelsParams, Map<String, dynamic>>>(
    () => RumpusLevelProvider(),
    instanceName: 'data.providers.level.rumpus',
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository<PlayersParams, Profile>>(
    () => RumpusProfileRepository(),
    instanceName: 'data.repositories.profile.rumpus',
  );

  // Styles
  getIt.registerLazySingleton(
    () => EdgeInsets.all(10),
    instanceName: 'style.space.10',
  );
  getIt.registerLazySingleton(
    () => TextStyle(fontWeight: FontWeight.w600),
    instanceName: 'style.font.bold',
  );
}
