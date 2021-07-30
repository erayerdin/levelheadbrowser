// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppearanceSettings extends Equatable {
  final Color profileCardMinColor;
  final Color profileCardMaxColor;
  final Color levelCardMinColor;
  final Color levelCardMaxColor;

  AppearanceSettings({
    required this.profileCardMinColor,
    required this.profileCardMaxColor,
    required this.levelCardMinColor,
    required this.levelCardMaxColor,
  });

  @override
  List<Object> get props => [
        profileCardMinColor,
        profileCardMaxColor,
        levelCardMinColor,
        levelCardMaxColor
      ];
}

class Settings extends Equatable {
  final AppearanceSettings appearance;
  Settings({
    required this.appearance,
  });

  @override
  List<Object> get props => [appearance];
}
