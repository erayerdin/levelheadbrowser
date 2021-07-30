// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:levelheadbrowser/presentation/pages/settings/pages/appearance/appearance.page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ListTile(
            title: Text('Appearance Settings'),
            subtitle: Text('Colors of profile and level cards'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AppearanceSettingsPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
