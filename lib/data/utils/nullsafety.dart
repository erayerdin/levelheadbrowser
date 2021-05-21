// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

Logger _logger = getIt.get();

void ifNotNullDo<T>(T? obj, Function(T) func) {
  if (obj != null) {
    _logger.v('Instance is not null. Performing operation...');
    func(obj);
  }
}
