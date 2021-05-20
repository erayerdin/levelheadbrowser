// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

final Logger _logger = getIt.get();

abstract class Deserializer<Local, Remote> {
  Future<Local> deserialize(Remote data);
}

Future<Local> deserialize<Local>(
    dynamic data, Deserializer deserializer) async {
  _logger.d('Deserializing from ${data.runtimeType.toString()} to $Local...');
  return deserializer.deserialize(data) as Future<Local>;
}
