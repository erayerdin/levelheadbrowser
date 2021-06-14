// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/data/models/settings.dart';

abstract class SettingsRepository<ParamModel, LocalModel> {
  Future<LocalModel> get(ParamModel params);
}

class HiveSettingsRepository implements SettingsRepository<dynamic, Settings> {
  @override
  Future<Settings> get(params) {
    // TODO: implement get
    throw UnimplementedError();
  }
}
