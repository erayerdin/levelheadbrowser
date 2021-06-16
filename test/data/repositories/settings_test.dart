// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/data/repositories/settings.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:tuple/tuple.dart';

void main() {
  group('hive', () {
    late SettingsRepository<dynamic, Settings> _repository;
    late Box box = getIt.get(instanceName: 'hive.box.settings');

    setUpAll(() async {
      setUpDI();
      await getIt.allReady();
      _repository = getIt.get(instanceName: 'data.repositories.settings.hive');
      box = await getIt.getAsync(instanceName: 'hive.box.settings');
      box.put('settings', {
        'card': {
          'profileCard': {
            'noAliasDefault': 'foo',
            'showJoined': true,
            'showSubscriberCount': true,
            'showFollowingCount': true,
            'colorInterpolationField': 0,
            'minColor': 'ffffff',
            'maxColor': '000000',
            'maxThreshold': 1,
          },
          'levelCard': {
            'colorInterpolationField': 0,
            'minColor': 'ffffff',
            'maxColor': '000000',
            'maxThreshold': 1,
          },
        },
        'formAppearance': {
          'profileFormAppearance': {
            'enableSubscriberCountField': true,
            'enablePlaytimeSecondsField': true,
          },
          'levelFormAppearance': {
            'enableLocationField': true,
            'enablePlaytimeSecondsField': true,
            'enableExposureBucksField': true,
            'enableReplayValueField': true,
          },
        },
        'defaultFiltering': {
          'defaultProfilesPageFiltering': {
            'subscriberCount': [0, 10],
            'playtimeSeconds': [0, 10],
            'sortBy': 0,
          },
          'defaultLevelsPageFiltering': {
            'inTower': true,
            'inMarketingDepartment': true,
            'inDailyBuild': true,
            'playtimeSeconds': [0, 10],
            'exposureBucks': [0, 10],
            'replayValue': [0, 10],
            'sortBy': 0,
          },
        },
      });
    });

    tearDownAll(() async {
      await box.deleteFromDisk();
    });

    test('get', () async {
      Settings settings = await _repository.get(null);

      expect(settings.card.profileCard.noAliasDefault, 'foo');
      expect(settings.card.profileCard.showJoined, true);
      expect(settings.card.profileCard.showSubscriberCount, true);
      expect(settings.card.profileCard.showFollowingCount, true);
      expect(
        settings.card.profileCard.colorInterpolationField,
        ProfileCardColorInterpolationField.values[0],
      );
      expect(settings.card.profileCard.minColor, Color(0xffffffff));
      expect(settings.card.profileCard.maxColor, Color(0xff000000));
      expect(
        settings.card.levelCard.colorInterpolationField,
        LevelCardColorInterpolationField.values[0],
      );
      expect(settings.card.levelCard.minColor, Color(0xffffffff));
      expect(settings.card.levelCard.maxColor, Color(0xff000000));
      expect(settings.card.levelCard.maxThreshold, 1);
      expect(
        settings
            .formAppearance.profileFormAppearance.enableSubscriberCountField,
        true,
      );
      expect(
        settings
            .formAppearance.profileFormAppearance.enablePlaytimeSecondsField,
        true,
      );
      expect(
        settings.formAppearance.levelFormAppearanceSettings.enableLocationField,
        true,
      );
      expect(
        settings.formAppearance.levelFormAppearanceSettings
            .enablePlaytimeSecondsField,
        true,
      );
      expect(
        settings.formAppearance.levelFormAppearanceSettings
            .enableExposureBucksField,
        true,
      );
      expect(
        settings
            .formAppearance.levelFormAppearanceSettings.enableReplayValueField,
        true,
      );
      expect(
        settings.defaultFiltering.defaultProfilesPageFiltering.subscriberCount,
        Tuple2(0, 10),
      );
      expect(
        settings.defaultFiltering.defaultProfilesPageFiltering.playtimeSeconds,
        Tuple2(0, 10),
      );
      expect(
        settings.defaultFiltering.defaultProfilesPageFiltering.sortBy,
        PlayersParamsSortField.values[0],
      );
      expect(
        settings.defaultFiltering.defaultLevelsPageFiltering.inTower,
        true,
      );
      expect(
        settings
            .defaultFiltering.defaultLevelsPageFiltering.inMarketingDepartment,
        true,
      );
      expect(
        settings.defaultFiltering.defaultLevelsPageFiltering.inDailyBuild,
        true,
      );
      expect(
        settings.defaultFiltering.defaultLevelsPageFiltering.playtimeSeconds,
        Tuple2(0, 10),
      );
      expect(
        settings.defaultFiltering.defaultLevelsPageFiltering.exposureBucks,
        Tuple2(0, 10),
      );
      expect(
        settings.defaultFiltering.defaultLevelsPageFiltering.replayValue,
        Tuple2(0, 10),
      );
      expect(
        settings.defaultFiltering.defaultLevelsPageFiltering.sortBy,
        LevelsParamsSortField.values[0],
      );
    });

    test('update', () async {
      Settings settings = await _repository.get(null);
      Settings newSettings = settings.copyWith(rumpusDelegationKey: 'foo');
      await _repository.update(newSettings);
      Settings updatedSettings = await _repository.get(null);
      expect(updatedSettings.rumpusDelegationKey, 'foo');
    });
  });
}
