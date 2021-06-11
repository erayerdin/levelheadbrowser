// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/repositories/level.dart';
import 'package:levelheadbrowser/di.dart';

void main() {
  group('rumpus', () {
    late LevelRepository<LevelsParams, Level> _repository;

    setUpAll(() async {
      setUpDI();
      await getIt.allReady(); // wait for container to be ready

      // remove cache interceptor, we're gonna mock it
      Dio client = getIt.get(instanceName: 'http.client.rumpus');
      client.interceptors.removeWhere(
        (element) => element is DioCacheInterceptor,
      );

      _repository = getIt.get(instanceName: 'data.repositories.level.rumpus');
    });

    test('list', () async {
      // should not fail
      await _repository.list(LevelsParams());
    });
  });
}
