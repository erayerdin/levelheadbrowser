// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/presentation/pages/settings/components/colorpicker/colorpicker.component.dart';
import 'package:levelheadbrowser/presentation/pages/settings/components/settingsui/section.component.dart';

part 'display.part.dart';
part 'color.part.dart';
part 'interpolation.part.dart';
part 'misc.part.dart';

class ProfileCardSettingsPage extends StatelessWidget {
  const ProfileCardSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Card Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _DisplayOptionsSection(),
            _ColorOptionsSection(),
            _InterpolationOptionsSection(),
            _MiscOptionsSection()
          ],
        ),
      ),
    );
  }
}
