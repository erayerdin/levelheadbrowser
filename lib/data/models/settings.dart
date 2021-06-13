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

import 'package:levelheadbrowser/data/models/params/players.dart';

class DefaultProfilesPageFilteringSettings {
  final Tuple2<int, int> subscriberCount;
  final Tuple2<int, int> playtimeSeconds;
  final PlayerParamsSortField sortBy;

  DefaultProfilesPageFilteringSettings({
    required this.subscriberCount,
    required this.playtimeSeconds,
    required this.sortBy,
  });
}

class DefaultLevelsPageFilteringSettings {
} // TODO implement default levels page filtering settings

class DefaultFilteringSettings {
  final DefaultProfilesPageFilteringSettings defaultProfilePageFiltering;
  final DefaultLevelsPageFilteringSettings defaultLevelsPageFiltering;

  DefaultFilteringSettings({
    required this.defaultProfilePageFiltering,
    required this.defaultLevelsPageFiltering,
  });
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
}

class FormAppearanceSettings {
  final ProfileFormAppearanceSettings profileFormAppearance;
  final LevelFormAppearanceSettings levelFormAppearanceSettings;

  FormAppearanceSettings({
    required this.profileFormAppearance,
    required this.levelFormAppearanceSettings,
  });
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
  final ProfileCardColorInterpolationField field;

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
    required this.field,
    required this.minColor,
    required this.maxColor,
    required this.maxThreshold,
  });
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
  final LevelCardColorInterpolationField field;
  final Color minColor;
  final Color maxColor;
  final num maxThreshold;

  LevelCardSettings({
    required this.field,
    required this.minColor,
    required this.maxColor,
    required this.maxThreshold,
  });
}

class CardSettings {
  final ProfileCardSettings profileCard;
  final LevelCardSettings levelCard;

  CardSettings({
    required this.profileCard,
    required this.levelCard,
  });
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
}
