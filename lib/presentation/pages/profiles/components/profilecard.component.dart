// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/di.dart';

TableRow _mapProfileFieldToTableRow(dynamic field, String label) {
  final TextStyle _boldTextStyle = getIt.get(instanceName: 'style.font.bold');

  return TableRow(children: [
    Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: Text(
        label,
        style: _boldTextStyle,
        textAlign: TextAlign.right,
      ),
    ),
    Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: Text(field.toString()),
    ),
  ]);
}

class ProfileCardComponent extends StatelessWidget {
  final EdgeInsets _margin = getIt.get(instanceName: 'style.space.10');

  final Profile profile;

  ProfileCardComponent({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: _margin,
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(100),
          },
          children: [
            _mapProfileFieldToTableRow(profile.alias, 'Alias'),
            _mapProfileFieldToTableRow(profile.dateJoined, 'Joined on'),
            _mapProfileFieldToTableRow(
                profile.stats.followingCount, 'Following'),
            _mapProfileFieldToTableRow(
                profile.stats.subscriberCount, 'Subscribers'),
          ],
        ),
      ),
    );
  }
}
