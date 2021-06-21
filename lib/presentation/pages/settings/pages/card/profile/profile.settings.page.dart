// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

class ProfileCardSettingsPage extends StatelessWidget {
  const ProfileCardSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Card Settings'),
      ),
      body: Container(
        child: Center(
          child: Text('Profile card settings page'),
        ),
      ),
    );
  }
}
