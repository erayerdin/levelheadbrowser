// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

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

class SettingsToHiveMapConverter
    extends Converter<Settings, Future<Map<String, dynamic>>> {
  @override
  Future<Map<String, dynamic>> convert(Settings input) async {
    // TODO: implement convert
    throw UnimplementedError();
  }
}

class HiveMapToSettingsConverter
    extends Converter<Map<String, dynamic>, Future<Settings>> {
  final Logger _logger = getIt.get();

  @override
  Future<Settings> convert(Map<String, dynamic> input) async {
    _logger.d('Converting Hive Map to Settings...');
    _logger.v('input hive map: $input');

    var settings = Settings(
      card: CardSettings(
        profileCard: ProfileCardSettings(
          noAliasDefault: input['card']['profileCard']['noAliasDefault'],
          showJoined: input['card']['profileCard']['showJoined'],
          showSubscriberCount: input['card']['profileCard']
              ['showSubscriberCount'],
          showFollowingCount: input['card']['profileCard']
              ['showFollowingCount'],
          colorInterpolationField: ProfileCardColorInterpolationField
              .values[input['card']['profileCard']['colorInterpolationField']],
          minColor: HexColor.fromHex(input['card']['profileCard']['minColor']),
          maxColor: HexColor.fromHex(input['card']['profileCard']['maxColor']),
          maxThreshold: input['card']['profileCard']['maxThreshold'],
        ),
        levelCard: LevelCardSettings(
          colorInterpolationField: LevelCardColorInterpolationField
              .values[input['card']['levelCard']['colorInterpolationField']],
          minColor: HexColor.fromHex(input['card']['levelCard']['minColor']),
          maxColor: HexColor.fromHex(input['card']['levelCard']['maxColor']),
          maxThreshold: input['card']['levelCard']['maxThreshold'],
        ),
      ),
      formAppearance: FormAppearanceSettings(
        profileFormAppearance: ProfileFormAppearanceSettings(
          enableSubscriberCountField: input['formAppearance']
              ['profileFormAppearance']['enableSubscriberCountField'],
          enablePlaytimeSecondsField: input['formAppearance']
              ['profileFormAppearance']['enablePlaytimeSecondsField'],
        ),
        levelFormAppearanceSettings: LevelFormAppearanceSettings(
          enableLocationField: input['formAppearance']['levelFormAppearance']
              ['enableLocationField'],
          enablePlaytimeSecondsField: input['formAppearance']
              ['levelFormAppearance']['enablePlaytimeSecondsField'],
          enableExposureBucksField: input['formAppearance']
              ['levelFormAppearance']['enableExposureBucksField'],
          enableReplayValueField: input['formAppearance']['levelFormAppearance']
              ['enableReplayValueField'],
        ),
      ),
      defaultFiltering: DefaultFilteringSettings(
        defaultProfilePageFiltering: DefaultProfilesPageFilteringSettings(
          subscriberCount: Tuple2(
            input['defaultFiltering']['defaultProfilePageFiltering']
                ['subscriberCount'][0],
            input['defaultFiltering']['defaultProfilePageFiltering']
                ['subscriberCount'][1],
          ),
          playtimeSeconds: Tuple2(
            input['defaultFiltering']['defaultProfilePageFiltering']
                ['playtimeSeconds'][0],
            input['defaultFiltering']['defaultProfilePageFiltering']
                ['playtimeSeconds'][1],
          ),
          sortBy: PlayerParamsSortField.values[input['defaultFiltering']
              ['defaultProfilePageFiltering']['sortBy']],
        ),
        defaultLevelsPageFiltering: DefaultLevelsPageFilteringSettings(
          inTower: input['defaultFiltering']['defaultLevelsPageFiltering']
              ['inTower'],
          inMarketingDepartment: input['defaultFiltering']
              ['defaultLevelsPageFiltering']['inMarketingDepartment'],
          inDailyBuild: input['defaultFiltering']['defaultLevelsPageFiltering']
              ['inDailyBuild'],
          playtimeSeconds: Tuple2(
            input['defaultFiltering']['defaultLevelsPageFiltering']
                ['playtimeSeconds'][0],
            input['defaultFiltering']['defaultLevelsPageFiltering']
                ['playtimeSeconds'][1],
          ),
          exposureBucks: Tuple2(
            input['defaultFiltering']['defaultLevelsPageFiltering']
                ['exposureBucks'][0],
            input['defaultFiltering']['defaultLevelsPageFiltering']
                ['exposureBucks'][1],
          ),
          replayValue: Tuple2(
            input['defaultFiltering']['defaultLevelsPageFiltering']
                ['replayValue'][0],
            input['defaultFiltering']['defaultLevelsPageFiltering']
                ['replayValue'][1],
          ),
          sortBy: LevelsParamsSortField.values[input['defaultFiltering']
              ['defaultLevelsPageFiltering']['sortBy']],
        ),
      ),
    );

    _logger.v('output settings: $settings');

    return settings;
  }
}
