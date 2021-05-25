// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:tuple/tuple.dart';

const SORT_BY_DROPDOWN_ITEMS = [
  DropdownMenuItem(
    child: Text('Earliest Joined'),
    value: Tuple2(true, PlayerParamsSortField.DateJoined),
  ),
  DropdownMenuItem(
    child: Text('Latest Joined'),
    value: Tuple2(false, PlayerParamsSortField.DateJoined),
  ),
  DropdownMenuItem(
    child: Text('Most Subscribers'),
    value: Tuple2(true, PlayerParamsSortField.SubscribeCount),
  ),
  DropdownMenuItem(
    child: Text('Least Subscribers'),
    value: Tuple2(false, PlayerParamsSortField.SubscribeCount),
  ),
  DropdownMenuItem(
    child: Text('Most Playtime'),
    value: Tuple2(true, PlayerParamsSortField.PlaytimeSeconds),
  ),
  DropdownMenuItem(
    child: Text('Least Playtime'),
    value: Tuple2(false, PlayerParamsSortField.PlaytimeSeconds),
  ),
  DropdownMenuItem(
    child: Text('Most Levels Played'),
    value: Tuple2(true, PlayerParamsSortField.PlayCount),
  ),
  DropdownMenuItem(
    child: Text('Least Levels Played'),
    value: Tuple2(false, PlayerParamsSortField.PlayCount),
  ),
  DropdownMenuItem(
    child: Text('Most Trophies'),
    value: Tuple2(true, PlayerParamsSortField.TrophyCount),
  ),
  DropdownMenuItem(
    child: Text('Least Trophies'),
    value: Tuple2(false, PlayerParamsSortField.TrophyCount),
  ),
  DropdownMenuItem(
    child: Text('Most Shoes'),
    value: Tuple2(true, PlayerParamsSortField.ShoeCount),
  ),
  DropdownMenuItem(
    child: Text('Least Shoes'),
    value: Tuple2(false, PlayerParamsSortField.ShoeCount),
  ),
  DropdownMenuItem(
    child: Text('Most Crowns'),
    value: Tuple2(true, PlayerParamsSortField.CrownCount),
  ),
  DropdownMenuItem(
    child: Text('Least Crowns'),
    value: Tuple2(false, PlayerParamsSortField.CrownCount),
  ),
  DropdownMenuItem(
    child: Text('Most Published Levels'),
    value: Tuple2(true, PlayerParamsSortField.PublishCount),
  ),
  DropdownMenuItem(
    child: Text('Least Published Levels'),
    value: Tuple2(false, PlayerParamsSortField.PublishCount),
  ),
];

Widget _buildSection(BuildContext context, String label, Widget widget) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headline6,
        ),
        widget,
      ],
    ),
  );
}

class ProfileFilterDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Filter Profiles',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Divider(),
                _buildSection(
                  context,
                  'Subscribers',
                  FormBuilderRangeSlider(
                    name: 'subscriberCount',
                    min: 0,
                    max: 10000,
                    initialValue: RangeValues(0, 10000),
                  ),
                ),
                _buildSection(
                  context,
                  'Playtime (in secs)',
                  FormBuilderRangeSlider(
                    name: 'playtimeSeconds',
                    min: 0,
                    max: 10000,
                    initialValue: RangeValues(0, 10000),
                  ),
                ),
                _buildSection(
                  context,
                  'Sort by',
                  FormBuilderDropdown(
                    name: 'sortBy',
                    items: SORT_BY_DROPDOWN_ITEMS,
                    allowClear: true,
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        child: Text('Reset'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                            () {}, // TODO implement onPressed for submit button
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
