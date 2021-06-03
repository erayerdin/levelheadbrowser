// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class LevelProvider<ParamModel, ResponseType> {
  Future<List<ResponseType>> list(ParamModel params);
}

class RumpusLevelProvider
    implements LevelProvider<LevelsParams, Map<String, dynamic>> {
  static const String _BASE_URL = '/levels';
  final Logger _logger = getIt.get();
  final Dio _client = getIt.get(instanceName: 'http.client.rumpus');
  final Converter<LevelsParams, Map<String, String>> _converter = getIt.get(
      instanceName: 'data.converters.players.toParamMap.fromLevelsParams');

  @override
  Future<List<Map<String, dynamic>>> list(LevelsParams params) async {
    _logger.d('Getting level list using Rumpus Level Provider...');
    _logger.v('params: $params');

    Response<Map<String, dynamic>> response = await _client.get(
      _BASE_URL,
      queryParameters: _converter.convert(params),
      options: Options(
        validateStatus: (status) => status == 200,
      ),
    );

    Map<String, dynamic> body = response.data!;
    // for some reason, it does not work without body['data']
    // it says it should be List<dynamic>, but it is not.
    List<Map<String, dynamic>> data = List.from(body['data']);
    _logger.v('data: $data');

    return data;
  }
}
