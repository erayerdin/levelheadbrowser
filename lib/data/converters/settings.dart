// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/settings.dart';

class SettingsToHiveMapConverter
    extends Converter<Settings, Future<Map<String, dynamic>>> {
  @override
  Future<Map<String, dynamic>> convert(Settings input) async {
    // TODO: implement convert
    throw UnimplementedError();
  }
}

class HiveMapToSettingsConverter
    extends Converter<Map<String, dynamic>, Future<Settings>> {
  @override
  Future<Settings> convert(Map<String, dynamic> input) async {
    // TODO: implement convert
    throw UnimplementedError();
  }
}
