// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:levelheadbrowser/data/models/settings.dart';

// REF https://stackoverflow.com/a/50081214/2926992
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class SettingsToMapConverter extends Converter<Settings, Map> {
  @override
  Map convert(Settings input) {
    return {
      'appearance': {
        'profileCardMinColor': input.appearance.profileCardMinColor.toHex(),
        'profileCardMaxColor': input.appearance.profileCardMaxColor.toHex(),
        'levelCardMinColor': input.appearance.levelCardMinColor.toHex(),
        'levelCardMaxColor': input.appearance.levelCardMaxColor.toHex(),
      }
    };
  }
}

class MapToSettingsConverter extends Converter<Map, Settings> {
  @override
  Settings convert(Map input) {
    return Settings(
      appearance: AppearanceSettings(
        profileCardMinColor:
            HexColor.fromHex(input['appearance']['profileCardMinColor']),
        profileCardMaxColor:
            HexColor.fromHex(input['appearance']['profileCardMaxColor']),
        levelCardMinColor:
            HexColor.fromHex(input['appearance']['levelCardMinColor']),
        levelCardMaxColor:
            HexColor.fromHex(input['appearance']['levelCardMaxColor']),
      ),
    );
  }
}
