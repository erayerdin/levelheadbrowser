// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';

class ProfileFormSettingsDialog extends StatelessWidget {
  const ProfileFormSettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return AlertDialog(
      title: Text('Profile Form Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormBuilderCheckbox(
            name: '',
            title: Text('Display Subscriber Slider'),
            initialValue: settingsBloc.settings.formAppearance
                .profileFormAppearance.enableSubscriberCountField,
            onChanged: (val) => settingsBloc.add(
              UpdateSettingsEvent(
                settings: settingsBloc.settings.copyWith(
                  formAppearance: settingsBloc.settings.formAppearance.copyWith(
                    profileFormAppearance: settingsBloc
                        .settings.formAppearance.profileFormAppearance
                        .copyWith(
                      enableSubscriberCountField: val,
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
                .profileFormAppearance.enablePlaytimeSecondsField,
            onChanged: (val) => settingsBloc.add(
              UpdateSettingsEvent(
                settings: settingsBloc.settings.copyWith(
                  formAppearance: settingsBloc.settings.formAppearance.copyWith(
                    profileFormAppearance: settingsBloc
                        .settings.formAppearance.profileFormAppearance
                        .copyWith(
                      enablePlaytimeSecondsField: val,
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
