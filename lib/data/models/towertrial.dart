// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:equatable/equatable.dart';

import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/record.dart';

class TowerTrial extends Equatable {
  final DateTime createdAt;
  final List<Level> levels;
  final List<Record> fastestTimeRecords;
  final List<Record> highScoreRecords;

  TowerTrial({
    required this.createdAt,
    required this.levels,
    required this.fastestTimeRecords,
    required this.highScoreRecords,
  });

  @override
  List<Object?> get props => [createdAt];
}
