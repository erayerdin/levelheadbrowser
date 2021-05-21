// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/providers/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

abstract class ProfileRepository<ParamModel, LocalModel> {
  Future<List<LocalModel>> list(ParamModel params);
}

class RumpusProfileRepository
    implements ProfileRepository<PlayersParams, Profile> {
  final Logger _logger = getIt.get();
  final ProfileProvider<PlayersParams, Map<String, dynamic>> _provider =
      getIt.get(instanceName: 'data.providers.profile.rumpus');
  final Converter<Map<String, dynamic>, Profile> _converter = getIt.get(
      instanceName: 'data.converters.profile.toProfile.fromRumpusMap');

  @override
  Future<List<Profile>> list(PlayersParams params) async {
    _logger.d('Getting profile list using Rumpus Profile Repository...');
    _logger.v('params: $params');

    List<Map<String, dynamic>> data = await _provider.list(params);

    List<Profile> profiles = data.map((e) => _converter.convert(e)).toList();
    _logger.v('profiles: $profiles');

    return profiles;
  }
}
