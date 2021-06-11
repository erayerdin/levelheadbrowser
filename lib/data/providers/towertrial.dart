// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:levelheadbrowser/data/models/params/towertrials.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class TowerTrialProvider<ParamModel, ResponseType> {
  Future<ResponseType> today(ParamModel params);
}

class RumpusTowerTrialProvider
    implements TowerTrialProvider<TowerTrialsParams, Map<String, dynamic>> {
  final Logger _logger = getIt.get();
  final Dio _client = getIt.get(instanceName: 'http.client.rumpus');

  @override
  Future<Map<String, dynamic>> today(TowerTrialsParams params) async {
    _logger.d(
        'Getting the tower trial of today using Rumpus Tower Trial Provider...');

    Response<Map<String, dynamic>> response = await _client.get(
      '/tower-trials',
      queryParameters: {'includeRecords': 'true'},
    );

    Map<String, dynamic> body = response.data!;
    Map<String, dynamic> data = List.from(body['data']).first;
    _logger.v('data: $data');

    return data;
  }
}
