// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final DEFAULT_SETTINGS = Settings(
  appearance: AppearanceSettings(
    profileCardMinColor: Colors.red,
    profileCardMaxColor: Colors.green,
    levelCardMinColor: Colors.red,
    levelCardMaxColor: Colors.green,
  ),
);

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

  @override
  bool get stringify => true;

  AppearanceSettings copyWith({
    Color? profileCardMinColor,
    Color? profileCardMaxColor,
    Color? levelCardMinColor,
    Color? levelCardMaxColor,
  }) {
    return AppearanceSettings(
      profileCardMinColor: profileCardMinColor ?? this.profileCardMinColor,
      profileCardMaxColor: profileCardMaxColor ?? this.profileCardMaxColor,
      levelCardMinColor: levelCardMinColor ?? this.levelCardMinColor,
      levelCardMaxColor: levelCardMaxColor ?? this.levelCardMaxColor,
    );
  }
}

class Settings extends Equatable {
  final AppearanceSettings appearance;
  Settings({
    required this.appearance,
  });

  @override
  List<Object> get props => [appearance];

  @override
  bool get stringify => true;

  Settings copyWith({
    AppearanceSettings? appearance,
  }) {
    return Settings(
      appearance: appearance ?? this.appearance,
    );
  }
}
