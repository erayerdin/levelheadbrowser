// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';

class LevelFormSettingsDialog extends StatelessWidget {
  const LevelFormSettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return AlertDialog(
      title: Text('Level Form Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormBuilderCheckbox(
            name: '',
            title: Text('Display Location Checkboxes'),
            initialValue: settingsBloc.settings.formAppearance
                .levelFormAppearanceSettings.enableLocationField,
            onChanged: (val) => settingsBloc.add(
              UpdateSettingsEvent(
                settings: settingsBloc.settings.copyWith(
                  formAppearance: settingsBloc.settings.formAppearance.copyWith(
                    levelFormAppearanceSettings: settingsBloc
                        .settings.formAppearance.levelFormAppearanceSettings
                        .copyWith(
                      enableLocationField: val,
                    ),
                  ),
                ),
              ),
            ),
          ),
          FormBuilderCheckbox(
            name: '',
            title: Text('Display Playtime Slider'),
            initialValue: settingsBloc.settings.formAppearance
                .levelFormAppearanceSettings.enablePlaytimeSecondsField,
            onChanged: (val) => settingsBloc.add(
              UpdateSettingsEvent(
                settings: settingsBloc.settings.copyWith(
                  formAppearance: settingsBloc.settings.formAppearance.copyWith(
                    levelFormAppearanceSettings: settingsBloc
                        .settings.formAppearance.levelFormAppearanceSettings
                        .copyWith(
                      enablePlaytimeSecondsField: val,
                    ),
                  ),
                ),
              ),
            ),
          ),
          FormBuilderCheckbox(
            name: '',
            title: Text('Display Exposure Bucks Slider'),
            initialValue: settingsBloc.settings.formAppearance
                .levelFormAppearanceSettings.enableExposureBucksField,
            onChanged: (val) => settingsBloc.add(
              UpdateSettingsEvent(
                settings: settingsBloc.settings.copyWith(
                  formAppearance: settingsBloc.settings.formAppearance.copyWith(
                    levelFormAppearanceSettings: settingsBloc
                        .settings.formAppearance.levelFormAppearanceSettings
                        .copyWith(
                      enableExposureBucksField: val,
                    ),
                  ),
                ),
              ),
            ),
          ),
          FormBuilderCheckbox(
            name: '',
            title: Text('Display Replay Value Slider'),
            initialValue: settingsBloc.settings.formAppearance
                .levelFormAppearanceSettings.enableReplayValueField,
            onChanged: (val) => settingsBloc.add(
              UpdateSettingsEvent(
                settings: settingsBloc.settings.copyWith(
                  formAppearance: settingsBloc.settings.formAppearance.copyWith(
                    levelFormAppearanceSettings: settingsBloc
                        .settings.formAppearance.levelFormAppearanceSettings
                        .copyWith(
                      enableReplayValueField: val,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
