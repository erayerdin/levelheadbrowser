// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/settings/components/settingsui/fullbutton.component.dart';
import 'package:levelheadbrowser/presentation/pages/settings/components/settingsui/section.component.dart';

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
          if (state is LoadedSettingsState) {
            return Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  SectionComponent(
                    label: 'Card Appearances',
                    children: [
                      FullButtonComponent(
                        label: 'Profile Card',
                        onTap: () {}, // TODO impl onTap
                      ),
                      FullButtonComponent(
                        label: 'Level Card',
                        onTap: () {}, // TODO impl onTap
                      ),
                    ],
                  ),
                  SectionComponent(
                    label: 'Form Settings',
                    children: [
                      FullButtonComponent(
                        label: 'Profile Form',
                        onTap: () {}, // TODO impl onTap
                      ),
                      FullButtonComponent(
                        label: 'Level Form',
                        onTap: () {}, // TODO impl onTap
                      ),
                    ],
                  ),
                  SectionComponent(
                    label: 'Default Filtering',
                    children: [
                      FullButtonComponent(
                        label: 'Profile Filtering',
                        onTap: () {}, // TODO impl onTap
                      ),
                      FullButtonComponent(
                        label: 'Level Filtering',
                        onTap: () {}, // TODO impl onTap
                      ),
                    ],
                  ),
                  SectionComponent(
                    label: 'Authentication',
                    children: [
                      FullButtonComponent(
                        label: 'Use Rumpus Delegation Key',
                        helpText: 'Add levels to favorites.',
                        onTap: () {}, // TODO impl onTap
                      )
                    ],
                  ),
                ],
              ),
            );
          }

          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
