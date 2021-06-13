// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

//############################//
// Default Filtering Settings //
//############################//
class DefaultProfilesPageFilteringSettings {
} // TODO implement default profiles page filtering settings

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
} // TODO implement profile form appearance settings

class LevelFormAppearanceSettings {
} // TODO implement level form appearance settings

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
class ProfileCardSettings {} // TODO implement profile card settings

class LevelCardSettings {} // TODO implement level card settings

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
