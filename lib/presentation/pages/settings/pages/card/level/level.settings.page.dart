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
import 'package:levelheadbrowser/presentation/pages/settings/components/colorpicker/colorpicker.component.dart';
import 'package:levelheadbrowser/presentation/pages/settings/components/settingsui/section.component.dart';

part 'color.part.dart';
part 'interpolation.part.dart';

class LevelCardSettingsPage extends StatelessWidget {
  const LevelCardSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Card Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _ColorOptionsSection(),
            _InterpolationOptionsSection(),
          ],
        ),
      ),
    );
  }
}
