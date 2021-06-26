// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileFormSettingsDialog extends StatelessWidget {
  const ProfileFormSettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Profile Form Settings'),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormBuilderCheckbox(
              name: '',
              title: Text('Display Subscriber Slider'),
              initialValue: false, // TODO impl initial value
              onChanged: (val) {}, // TODO impl onChanged
            ),
            FormBuilderCheckbox(
              name: '',
              title: Text('Display Playtime Slider'),
              initialValue: false, // TODO impl initial value
              onChanged: (val) {}, // TODO impl onChanged
            ),
          ],
        ),
      ),
    );
  }
}
