// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

part of 'profile.settings.page.dart';

class _DisplayOptionsSection extends StatelessWidget {
  const _DisplayOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionComponent(
      label: 'Information Display Options',
      children: [
        FormBuilderSwitch(
          name: '',
          title: Text('Show Joined'),
          initialValue: false, // TODO get initial value
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (val) {}, // TODO impl onChanged
        ),
        FormBuilderSwitch(
          name: '',
          title: Text('Show Subscriber Count'),
          initialValue: false, // TODO get initial value
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (val) {}, // TODO impl onChanged
        ),
        FormBuilderSwitch(
          name: '',
          title: Text('Show Following Count'),
          initialValue: false, // TODO get initial value
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (val) {}, // TODO impl onChanged
        ),
      ],
    );
  }
}
