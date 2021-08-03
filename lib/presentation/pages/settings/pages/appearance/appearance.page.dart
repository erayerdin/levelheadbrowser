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
import 'package:levelheadbrowser/presentation/pages/settings/components/confirmation_dialog/confirmation_dialog.component.dart';
import 'package:levelheadbrowser/presentation/pages/settings/logic/settings_save/settings_save_cubit.dart';

class AppearanceSettingsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  AppearanceSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsSaveCubit()),
      ],
      child: Builder(
        builder: (context) => FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {},
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              if (settingsState is LoadedSettingsState) {
                return BlocBuilder<SettingsSaveCubit, Function()?>(
                  builder: (context, saveState) {
                    return WillPopScope(
                      onWillPop: saveState == null
                          ? () async => true
                          : () => _showConfirmationDialog(context),
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text('Appearance Settings'),
                          actions: [
                            IconButton(
                              onPressed: saveState,
                              icon: Icon(Icons.save),
                            ),
                          ],
                        ),
                        body: ListView(
                          padding: EdgeInsets.all(10),
                          children: [
                            FormBuilderColorPicker(
                              labelText: 'Profile Card Minimum Color',
                              initialColor: settingsState
                                  .settings.appearance.profileCardMinColor,
                              onChanged: (_) =>
                                  BlocProvider.of<SettingsSaveCubit>(context)
                                      .emit(
                                () => _saveSettings(context),
                              ),
                              name: 'profileMinColor',
                            ),
                            FormBuilderColorPicker(
                              labelText: 'Profile Card Maximum Color',
                              initialColor: settingsState
                                  .settings.appearance.profileCardMaxColor,
                              onChanged: (_) =>
                                  BlocProvider.of<SettingsSaveCubit>(context)
                                      .emit(
                                () => _saveSettings(context),
                              ),
                              name: 'profileMaxColor',
                            ),
                            FormBuilderColorPicker(
                              labelText: 'Level Card Minimum Color',
                              initialColor: settingsState
                                  .settings.appearance.levelCardMinColor,
                              onChanged: (_) =>
                                  BlocProvider.of<SettingsSaveCubit>(context)
                                      .emit(
                                () => _saveSettings(context),
                              ),
                              name: 'levelMinColor',
                            ),
                            FormBuilderColorPicker(
                              labelText: 'Level Card Maximum Color',
                              initialColor: settingsState
                                  .settings.appearance.levelCardMaxColor,
                              name: 'levelMaxColor',
                              onChanged: (_) =>
                                  BlocProvider.of<SettingsSaveCubit>(context)
                                      .emit(
                                () => _saveSettings(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future _saveSettings(BuildContext context) async {}

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    showDialog<bool>(
        context: context, builder: (context) => ConfirmationDialog());
    return false;
  }
}
