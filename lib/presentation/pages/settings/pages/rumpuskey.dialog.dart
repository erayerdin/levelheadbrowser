// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

const _RUMPUS_KEY_URL =
    'https://www.bscotch.net/account?delegationPermissions=rce-lh-read,rce-lh-manage-bookmarks,rce-lh-manage-following,rce-lh-report&delegationKeyName=levelheadbrowser';

class RumpusDelegationKeyDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  RumpusDelegationKeyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return AlertDialog(
      title: Text('Add Rumpus Delegation Key'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MarkdownBody(
            data:
                'The buttons below will redirect you or help you copy the URL '
                'to the **Delegation Keys** section of your account settings '
                'page.\n\n'
                'In that section, you will get a Rumpus Delegation Key, which '
                'will help us to take some actions such as **adding levels to '
                'or removing them from favorites** or **following or unfollowing '
                'users** on your behalf.\n\n'
                'Please note that this software is licensed under MPL 2.0, which '
                'you can read [here](http://mozilla.org/MPL/2.0/). The license '
                'clearly states that **we cannot be hold liable by any harm done '
                'to your data in any way**.\n\n'
                'Also, keep in mind that this application is still in early '
                'stages of development, which means it can act in a way that it is '
                'not supposed to act.\n\n'
                'By adding your Rumpus Delegation Key, **you accept the risks**.',
            onTapLink: (text, href, title) async => await launch(href!),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => await launch(_RUMPUS_KEY_URL),
                child: Text('Take Me to My Account Page'),
              ),
              IconButton(
                onPressed: () async {
                  await FlutterClipboard.copy(_RUMPUS_KEY_URL);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Copied URL to clipboard.'),
                    ),
                  );
                },
                icon: Icon(Icons.copy),
              )
            ],
          ),
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'delegationKey',
                  decoration:
                      InputDecoration(labelText: 'Rumpus Delegation Key'),
                  initialValue: settingsBloc.settings.rumpusDelegationKey,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  autovalidateMode: AutovalidateMode.always,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.save();
                    var vals = _formKey.currentState?.value;
                    String? key = vals?['delegationKey'];
                    settingsBloc.add(
                      UpdateSettingsEvent(
                        settings: settingsBloc.settings.copyWith(
                          rumpusDelegationKey: key == '' ? null : key,
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Saved Rumpus delegation key.'),
                      ),
                    );
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
