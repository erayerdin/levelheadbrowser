// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/towertrial.dart';

class RumpusMapToTowerTrialConverter
    extends Converter<Map<String, dynamic>, Future<TowerTrial>> {
  @override
  Future<TowerTrial> convert(Map<String, dynamic> input) {
    // TODO: implement convert
    throw UnimplementedError();
  }
}
