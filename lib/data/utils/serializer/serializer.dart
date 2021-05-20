// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

final Logger _logger = getIt.get();

abstract class Serializer<Local, Remote> {
  Future<Remote> serialize(Local instance);
}

Future<Remote> serialize<Remote>(
    dynamic instance, Serializer serializer) async {
  _logger
      .d('Deserializing from ${instance.runtimeType.toString()} to $Remote...');
  return serializer.serialize(instance) as Future<Remote>;
}
