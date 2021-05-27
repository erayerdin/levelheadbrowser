// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/data/models/profile.dart';

class Record {
  // TODO do we need a Level field here?
  final Profile profile;
  final DateTime createdAt;
  final num value;

  Record({
    required this.profile,
    required this.createdAt,
    required this.value,
  });
}
