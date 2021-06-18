// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

part of 'settings.page.dart';

class _ProfileCardsAppearanceSettingsPage extends StatelessWidget {
  const _ProfileCardsAppearanceSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Cards Appearance'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              _SettingsSection(
                title: 'Display Information',
                children: [
                  // TODO remove underline on switches
                  FormBuilderSwitch(
                    name: '',
                    title: Text(
                      'Show Joined Date',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    initialValue:
                        settingsBloc.settings.card.profileCard.showJoined,
                    onChanged: (val) {
                      var settings = settingsBloc.settings.copyWith(
                        card: settingsBloc.settings.card.copyWith(
                          profileCard:
                              settingsBloc.settings.card.profileCard.copyWith(
                            showJoined: val,
                          ),
                        ),
                      );
                      settingsBloc.add(UpdateSettingsEvent(settings: settings));
                    },
                  ),
                  FormBuilderSwitch(
                    name: '',
                    title: Text(
                      'Show Subscriber Count',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    initialValue: settingsBloc
                        .settings.card.profileCard.showSubscriberCount,
                    onChanged: (val) {
                      var settings = settingsBloc.settings.copyWith(
                        card: settingsBloc.settings.card.copyWith(
                          profileCard:
                              settingsBloc.settings.card.profileCard.copyWith(
                            showSubscriberCount: val,
                          ),
                        ),
                      );
                      settingsBloc.add(UpdateSettingsEvent(settings: settings));
                    },
                  ),
                  FormBuilderSwitch(
                    name: '',
                    title: Text(
                      'Show Following Count',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    initialValue: settingsBloc
                        .settings.card.profileCard.showFollowingCount,
                    onChanged: (val) {
                      var settings = settingsBloc.settings.copyWith(
                        card: settingsBloc.settings.card.copyWith(
                          profileCard:
                              settingsBloc.settings.card.profileCard.copyWith(
                            showFollowingCount: val,
                          ),
                        ),
                      );

                      settingsBloc.add(UpdateSettingsEvent(settings: settings));
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              _SettingsSection(
                title: 'Coloring',
                children: [
                  SettingsColorPickerComponent(
                    label: 'Color of Minimum Value',
                    initialColor: Colors.red, // TODO change on state
                    onChange: (color) {}, // TODO implement onChange
                  ),
                  SettingsColorPickerComponent(
                    label: 'Color of Maximum Value',
                    initialColor: Colors.green, // TODO change on state
                    onChange: (color) {}, // TODO implement onChange
                  ),
                  FormBuilderDropdown<ProfileCardColorInterpolationField>(
                    name: '',
                    items: ProfileCardColorInterpolationField.values
                        .map((e) => DropdownMenuItem(
                              child: Text(e.toRepr()),
                              value: e,
                            ))
                        .toList(),
                    decoration:
                        InputDecoration(labelText: 'Color Interpolation Field'),
                    initialValue:
                        ProfileCardColorInterpolationField.SubscriberCount,
                    onChanged: (val) {}, // TODO implement onChanged
                  ),
                  FormBuilderSlider(
                    name: '',
                    decoration: InputDecoration(labelText: 'Maximum Threshold'),
                    initialValue: 10000,
                    min: 0,
                    max: 100000,
                    onChanged: (val) {}, // TODO implement onChanged
                  ),
                ],
              ),
              SizedBox(height: 20),
              _SettingsSection(
                title: 'Misc',
                children: [
                  FormBuilderTextField(
                    name: '',
                    decoration: InputDecoration(labelText: 'No Alias Default'),
                    initialValue: '<no-alias>', // TODO change on state
                    onChanged: (val) {}, // TODO implement onChanged
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
