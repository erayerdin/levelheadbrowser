// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:levelheadbrowser/data/models/params/towertrials.dart';
import 'package:levelheadbrowser/data/models/towertrial.dart';
import 'package:levelheadbrowser/data/repositories/towertrial.dart';
import 'package:levelheadbrowser/di.dart';

void main() {
  group('rumpus', () {
    late TowerTrialRepository<TowerTrialsParams, TowerTrial> _repository;

    setUpAll(() async {
      setUpDI();
      await getIt.allReady();

      // remove cache interceptor, we're gonna mock it
      Dio client = getIt.get(instanceName: 'http.client.rumpus');
      client.interceptors.removeWhere(
        (element) => element is DioCacheInterceptor,
      );
      _repository =
          getIt.get(instanceName: 'data.repositories.towertrial.rumpus');
    });

    test('today', () async {
      // should not fail
      await _repository.today(TowerTrialsParams());
    });
  });
}
