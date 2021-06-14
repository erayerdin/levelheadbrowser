// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/data/models/settings.dart';

abstract class SettingsProvider<ParamModel, ResponseType> {
  Future<ResponseType> get(ParamModel params);
}

class HiveSettingsProvider implements SettingsProvider<dynamic, Settings> {
  @override
  Future<Settings> get(params) async {
    // TODO: implement get
    throw UnimplementedError();
  }
}
