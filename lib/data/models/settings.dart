// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

//############################//
// Default Filtering Settings //
//############################//
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';

class DefaultProfilesPageFilteringSettings {
  final Tuple2<int, int> subscriberCount;
  final Tuple2<int, int> playtimeSeconds;
  final PlayersParamsSortField sortBy;

  DefaultProfilesPageFilteringSettings({
    required this.subscriberCount,
    required this.playtimeSeconds,
    required this.sortBy,
  });

  @override
  String toString() =>
      'DefaultProfilesPageFilteringSettings(subscriberCount: $subscriberCount, playtimeSeconds: $playtimeSeconds, sortBy: $sortBy)';
}

class DefaultLevelsPageFilteringSettings {
  final bool inTower;
  final bool inMarketingDepartment;
  final bool inDailyBuild;
  final Tuple2<int, int> playtimeSeconds;
  final Tuple2<int, int> exposureBucks;
  final Tuple2<int, int> replayValue;
  final LevelsParamsSortField sortBy;

  DefaultLevelsPageFilteringSettings({
    required this.inTower,
    required this.inMarketingDepartment,
    required this.inDailyBuild,
    required this.playtimeSeconds,
    required this.exposureBucks,
    required this.replayValue,
    required this.sortBy,
  });

  @override
  String toString() {
    return 'DefaultLevelsPageFilteringSettings(inTower: $inTower, inMarketingDepartment: $inMarketingDepartment, inDailyBuild: $inDailyBuild, playtimeSeconds: $playtimeSeconds, exposureBucks: $exposureBucks, replayValue: $replayValue, sortBy: $sortBy)';
  }
}

class DefaultFilteringSettings {
  final DefaultProfilesPageFilteringSettings defaultProfilesPageFiltering;
  final DefaultLevelsPageFilteringSettings defaultLevelsPageFiltering;

  DefaultFilteringSettings({
    required this.defaultProfilesPageFiltering,
    required this.defaultLevelsPageFiltering,
  });

  @override
  String toString() =>
      'DefaultFilteringSettings(defaultProfilesPageFiltering: $defaultProfilesPageFiltering, defaultLevelsPageFiltering: $defaultLevelsPageFiltering)';
}

//##########################//
// Form Appearance Settings //
//##########################//
class ProfileFormAppearanceSettings {
  final bool enableSubscriberCountField;
  final bool enablePlaytimeSecondsField;

  ProfileFormAppearanceSettings({
    required this.enableSubscriberCountField,
    required this.enablePlaytimeSecondsField,
  });

  @override
  String toString() =>
      'ProfileFormAppearanceSettings(enableSubscriberCountField: $enableSubscriberCountField, enablePlaytimeSecondsField: $enablePlaytimeSecondsField)';
}

class LevelFormAppearanceSettings {
  final bool enableLocationField;
  final bool enablePlaytimeSecondsField;
  final bool enableExposureBucksField;
  final bool enableReplayValueField;

  LevelFormAppearanceSettings({
    required this.enableLocationField,
    required this.enablePlaytimeSecondsField,
    required this.enableExposureBucksField,
    required this.enableReplayValueField,
  });

  @override
  String toString() {
    return 'LevelFormAppearanceSettings(enableLocationField: $enableLocationField, enablePlaytimeSecondsField: $enablePlaytimeSecondsField, enableExposureBucksField: $enableExposureBucksField, enableReplayValueField: $enableReplayValueField)';
  }
}

class FormAppearanceSettings {
  final ProfileFormAppearanceSettings profileFormAppearance;
  final LevelFormAppearanceSettings levelFormAppearanceSettings;

  FormAppearanceSettings({
    required this.profileFormAppearance,
    required this.levelFormAppearanceSettings,
  });

  @override
  String toString() =>
      'FormAppearanceSettings(profileFormAppearance: $profileFormAppearance, levelFormAppearanceSettings: $levelFormAppearanceSettings)';
}

//###############//
// Card Settings //
//###############//
enum ProfileCardColorInterpolationField {
  SubscriberCount,
  FollowingCount,
  CrownCount,
  ShoeCount,
  PlaytimeSeconds,
  HiddenGemCount,
  TrophyCount,
  CampaignProgress,
  TimeTrophyCount,
}

/// Settings related to profile card.
class ProfileCardSettings {
  /// Shown when a profile has no alias defined.
  final String noAliasDefault;

  /// Whether to show joined human-readable time format.
  final bool showJoined;

  /// Whether to show subscriber count.
  final bool showSubscriberCount;

  /// Whether to show following count.
  final bool showFollowingCount;

  /// The field to be used to colorize the card.
  final ProfileCardColorInterpolationField colorInterpolationField;

  /// The color of the card to be used in minimum amount, which is 0.
  final Color minColor;

  /// The color of the card to be used in maximum amount, which is defined in
  /// `maxThreshold` attribute.
  final Color maxColor;

  /// The maximum threshold of `field`.
  final num maxThreshold;

  ProfileCardSettings({
    required this.noAliasDefault,
    required this.showJoined,
    required this.showSubscriberCount,
    required this.showFollowingCount,
    required this.colorInterpolationField,
    required this.minColor,
    required this.maxColor,
    required this.maxThreshold,
  });

  @override
  String toString() {
    return 'ProfileCardSettings(noAliasDefault: $noAliasDefault, showJoined: $showJoined, showSubscriberCount: $showSubscriberCount, showFollowingCount: $showFollowingCount, colorInterpolationField: $colorInterpolationField, minColor: $minColor, maxColor: $maxColor, maxThreshold: $maxThreshold)';
  }
}

enum LevelCardColorInterpolationField {
  InTower,
  InTowerTrial,
  InDailyBuild,
  RequiredPlayerCount,
  AttemptCount,
  PlayerCount,
  SuccessCount,
  ClearRate,
  FailureRate,
  FavoriteCount,
  LikeCount,
  PlaytimeSeconds,
  ReplayValue,
  ExposureBucks,
}

class LevelCardSettings {
  final LevelCardColorInterpolationField colorInterpolationField;
  final Color minColor;
  final Color maxColor;
  final num maxThreshold;

  LevelCardSettings({
    required this.colorInterpolationField,
    required this.minColor,
    required this.maxColor,
    required this.maxThreshold,
  });

  @override
  String toString() {
    return 'LevelCardSettings(colorInterpolationField: $colorInterpolationField, minColor: $minColor, maxColor: $maxColor, maxThreshold: $maxThreshold)';
  }
}

class CardSettings {
  final ProfileCardSettings profileCard;
  final LevelCardSettings levelCard;

  CardSettings({
    required this.profileCard,
    required this.levelCard,
  });

  @override
  String toString() =>
      'CardSettings(profileCard: $profileCard, levelCard: $levelCard)';
}

class Settings {
  final CardSettings card;
  final FormAppearanceSettings formAppearance;
  final DefaultFilteringSettings defaultFiltering;
  final String? rumpusDelegationKey;

  Settings({
    required this.card,
    required this.formAppearance,
    required this.defaultFiltering,
    this.rumpusDelegationKey,
  });

  Settings copyWith({
    CardSettings? card,
    FormAppearanceSettings? formAppearance,
    DefaultFilteringSettings? defaultFiltering,
    String? rumpusDelegationKey,
  }) {
    return Settings(
      card: card ?? this.card,
      formAppearance: formAppearance ?? this.formAppearance,
      defaultFiltering: defaultFiltering ?? this.defaultFiltering,
      rumpusDelegationKey: rumpusDelegationKey ?? this.rumpusDelegationKey,
    );
  }

  @override
  String toString() {
    return 'Settings(card: $card, formAppearance: $formAppearance, defaultFiltering: $defaultFiltering, rumpusDelegationKey: $rumpusDelegationKey)';
  }
}
