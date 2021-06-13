// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Cards Appearance',
            tiles: [
              SettingsTile(title: 'Profile Cards'),
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
      ),
    );
  }
}
