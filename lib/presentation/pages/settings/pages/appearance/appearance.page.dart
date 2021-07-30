// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/components/colorpicker/colorpicker.component.dart';

class AppearanceSettingsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  AppearanceSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {},
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is LoadedSettingsState) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Appearance Settings'),
                actions: [
                  IconButton(
                    onPressed: null, // TODO activate depending on state
                    icon: Icon(Icons.save),
                  ),
                ],
              ),
              body: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  FormBuilderColorPicker(
                    labelText: 'Profile Card Minimum Color',
                    initialColor: state.settings.appearance.profileCardMinColor,
                    onChanged: (color) {}, // TODO change saveable state
                    name: 'profileMinColor',
                  ),
                  FormBuilderColorPicker(
                    labelText: 'Profile Card Maximum Color',
                    initialColor: state.settings.appearance.profileCardMaxColor,
                    onChanged: (color) {}, // TODO change saveable state
                    name: 'profileMaxColor',
                  ),
                  FormBuilderColorPicker(
                    labelText: 'Level Card Minimum Color',
                    initialColor: state.settings.appearance.levelCardMinColor,
                    onChanged: (color) {}, // TODO change saveable state
                    name: 'levelMinColor',
                  ),
                  FormBuilderColorPicker(
                    labelText: 'Level Card Maximum Color',
                    initialColor: state.settings.appearance.levelCardMaxColor,
                    name: 'levelMaxColor',
                    onChanged: (color) {}, // TODO change saveable state
                  ),
                ],
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
