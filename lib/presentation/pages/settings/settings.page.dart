// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';

@protected
class SettingsPageSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsPageSection({
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

            return Container(
              child: Center(
                child: Text('Settings page.'),
              ),
            );
          },
        ));
  }
}
