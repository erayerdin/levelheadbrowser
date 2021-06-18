// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/settings/components/colorpicker.component.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

part 'profilecards.appearance.settings.page.dart';

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        Divider(),
        ...children,
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is LoadingSettingsState) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return SettingsList(
              sections: [
                SettingsSection(
                  title: 'Cards Appearance',
                  tiles: [
                    SettingsTile(
                      title: 'Profile Cards',
                      onPressed: (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                _ProfileCardsAppearanceSettingsPage(),
                          ),
                        );
                      },
                    ),
                    SettingsTile(title: 'Level Cards'),
                  ],
                ),
                SettingsSection(
                  title: 'Filter Forms Appearance',
                  tiles: [
                    SettingsTile(title: 'Profiles Filter Form'),
                    SettingsTile(title: 'Levels Filter Form'),
                  ],
                ),
                SettingsSection(
                  title: 'Default Filtering',
                  tiles: [
                    SettingsTile(title: 'Profiles Page'),
                    SettingsTile(title: 'Levels Page'),
                  ],
                ),
                SettingsSection(
                  title: 'Link Accounts',
                  tiles: [
                    SettingsTile(title: 'Log in with Rumpus'),
                  ],
                ),
                SettingsSection(
                  title: 'Misc',
                  tiles: [
                    SettingsTile(
                      title: 'Source Code',
                      onPressed: (_) async => await launch(
                        'https://github.com/erayerdin/levelheadbrowser',
                      ),
                    ),
                    SettingsTile(
                      title: 'Issues',
                      onPressed: (context) async => await launch(
                        'https://github.com/erayerdin/levelheadbrowser/issues',
                      ),
                    ),
                    SettingsTile(title: 'Donate'),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
