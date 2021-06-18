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

class SettingsToHiveMapConverter
    extends Converter<Settings, Future<Map<String, dynamic>>> {
  final Logger _logger = getIt.get();

  @override
  Future<Map<String, dynamic>> convert(Settings input) async {
    _logger.d('Converting Settings to Hive Map...');
    _logger.v('input settings: $input');

    Map<String, dynamic> map = {
      'rumpusDelegationKey': input.rumpusDelegationKey,
      'card': {
        'profileCard': {
          'noAliasDefault': input.card.profileCard.noAliasDefault,
          'showJoined': input.card.profileCard.showJoined,
          'showSubscriberCount': input.card.profileCard.showSubscriberCount,
          'showFollowingCount': input.card.profileCard.showFollowingCount,
          'colorInterpolationField':
              input.card.profileCard.colorInterpolationField.index,
          'minColor': input.card.profileCard.minColor.toHex(),
          'maxColor': input.card.profileCard.maxColor.toHex(),
          'maxThreshold': input.card.profileCard.maxThreshold,
        },
        'levelCard': {
          'colorInterpolationField':
              input.card.levelCard.colorInterpolationField.index,
          'minColor': input.card.levelCard.minColor.toHex(),
          'maxColor': input.card.levelCard.maxColor.toHex(),
          'maxThreshold': input.card.levelCard.maxThreshold,
        },
      },
      'formAppearance': {
        'profileFormAppearance': {
          'enableSubscriberCountField': input
              .formAppearance.profileFormAppearance.enableSubscriberCountField,
          'enablePlaytimeSecondsField': input
              .formAppearance.profileFormAppearance.enablePlaytimeSecondsField,
        },
        'levelFormAppearance': {
          'enableLocationField': input
              .formAppearance.levelFormAppearanceSettings.enableLocationField,
          'enablePlaytimeSecondsField': input.formAppearance
              .levelFormAppearanceSettings.enablePlaytimeSecondsField,
          'enableExposureBucksField': input.formAppearance
              .levelFormAppearanceSettings.enableExposureBucksField,
          'enableReplayValueField': input.formAppearance
              .levelFormAppearanceSettings.enableReplayValueField,
        },
      },
      'defaultFiltering': {
        'defaultProfilesPageFiltering': {
          'subscriberCount': input
              .defaultFiltering.defaultProfilesPageFiltering.subscriberCount
              ?.toList(),
          'playtimeSeconds': input
              .defaultFiltering.defaultLevelsPageFiltering.playtimeSeconds
              ?.toList(),
          'sortBy':
              input.defaultFiltering.defaultLevelsPageFiltering.sortBy?.index,
        },
        'defaultLevelsPageFiltering': {
          'inTower': input.defaultFiltering.defaultLevelsPageFiltering.inTower,
          'inMarketingDepartment': input.defaultFiltering
              .defaultLevelsPageFiltering.inMarketingDepartment,
          'inDailyBuild':
              input.defaultFiltering.defaultLevelsPageFiltering.inDailyBuild,
          'playtimeSeconds': input
              .defaultFiltering.defaultLevelsPageFiltering.playtimeSeconds
              ?.toList(),
          'exposureBucks': input
              .defaultFiltering.defaultLevelsPageFiltering.exposureBucks
              ?.toList(),
          'replayValue': input
              .defaultFiltering.defaultLevelsPageFiltering.replayValue
              ?.toList(),
          'sortBy':
              input.defaultFiltering.defaultLevelsPageFiltering.sortBy?.index,
        },
      },
    };

    _logger.v('output map: $map');
    return map;
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
      rumpusDelegationKey: input['rumpusDelegationKey'],
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
        defaultProfilesPageFiltering: DefaultProfilesPageFilteringSettings(
          subscriberCount: input['defaultFiltering']
                      ['defaultProfilesPageFiltering']['subscriberCount'] ==
                  null
              ? null
              : Tuple2.fromList(
                  input['defaultFiltering']['defaultProfilesPageFiltering']
                      ['subscriberCount'],
                ),
          playtimeSeconds: input['defaultFiltering']
                      ['defaultProfilesPageFiltering']['playtimeSeconds'] ==
                  null
              ? null
              : Tuple2.fromList(
                  input['defaultFiltering']['defaultProfilesPageFiltering']
                      ['playtimeSeconds'],
                ),
          sortBy: input['defaultFiltering']['defaultProfilesPageFiltering']
                      ['sortBy'] ==
                  null
              ? null
              : PlayersParamsSortField.values[input['defaultFiltering']
                  ['defaultProfilesPageFiltering']['sortBy']],
        ),
        defaultLevelsPageFiltering: DefaultLevelsPageFilteringSettings(
          inTower: input['defaultFiltering']['defaultLevelsPageFiltering']
              ['inTower'],
          inMarketingDepartment: input['defaultFiltering']
              ['defaultLevelsPageFiltering']['inMarketingDepartment'],
          inDailyBuild: input['defaultFiltering']['defaultLevelsPageFiltering']
              ['inDailyBuild'],
          playtimeSeconds: input['defaultFiltering']
                      ['defaultLevelsPageFiltering']['playtimeSeconds'] ==
                  null
              ? null
              : Tuple2.fromList(
                  input['defaultFiltering']['defaultLevelsPageFiltering']
                      ['playtimeSeconds'],
                ),
          exposureBucks: input['defaultFiltering']['defaultLevelsPageFiltering']
                      ['exposureBucks'] ==
                  null
              ? null
              : Tuple2.fromList(
                  input['defaultFiltering']['defaultLevelsPageFiltering']
                      ['exposureBucks'],
                ),
          replayValue: input['defaultFiltering']['defaultLevelsPageFiltering']
                      ['replayValue'] ==
                  null
              ? null
              : Tuple2.fromList(
                  input['defaultFiltering']['defaultLevelsPageFiltering']
                      ['replayValue'],
                ),
          sortBy: input['defaultFiltering']['defaultLevelsPageFiltering']
                      ['sortBy'] ==
                  null
              ? null
              : LevelsParamsSortField.values[input['defaultFiltering']
                  ['defaultLevelsPageFiltering']['sortBy']],
        ),
      ),
    );

    _logger.v('output settings: $settings');
    return settings;
  }
}
