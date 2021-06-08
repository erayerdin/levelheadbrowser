// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/utils/presentation.dart';
import 'package:tuple/tuple.dart';

const BUCKS_COUNT = Tuple2(0, 100000);

const SORT_BY_DROPDOWN_ITEMS = [
  // TODO initialize values
  DropdownMenuItem(
    child: Text('Oldest Levels'),
    value: true,
  ),
  DropdownMenuItem(
    child: Text('Newest Levels'),
    value: true,
  ),
  DropdownMenuItem(
    child: Text('Most Playtime'),
    value: true,
  ),
  DropdownMenuItem(
    child: Text('Least Playtime'),
    value: true,
  ),
  DropdownMenuItem(
    child: Text('Most Replayed'),
    value: true,
  ),
  DropdownMenuItem(
    child: Text('Least Replayed'),
    value: true,
  ),
  DropdownMenuItem(
    child: Text('Most Bucks'),
    value: true,
  ),
  DropdownMenuItem(
    child: Text('Least Bucks'),
    value: true,
  ),
];

class LevelFilterPanel extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  LevelFilterPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: Text(
                'Filter Levels',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Divider(),
            buildSection(
              context,
              'Where Its Located',
              Column(
                children: [
                  FormBuilderCheckbox(
                    name: 'inTower',
                    title: Text('In Tower'),
                    initialValue: false,
                  ),
                  FormBuilderCheckbox(
                    name: 'inMarketingDepartment',
                    title: Text('In Marketing Department'),
                    initialValue: false,
                  ),
                  FormBuilderCheckbox(
                    name: 'inDailyBuild',
                    title: Text('In Daily Build'),
                    initialValue: false,
                  ),
                ],
              ),
            ),
            buildSection(
              context,
              'Bucks',
              FormBuilderRangeSlider(
                name: 'exposureBucks',
                min: BUCKS_COUNT.item1.toDouble(),
                max: BUCKS_COUNT.item2.toDouble(),
                initialValue: RangeValues(
                  BUCKS_COUNT.item1.toDouble(),
                  BUCKS_COUNT.item2.toDouble(),
                ),
              ),
            ),
            buildSection(
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
                    onPressed: () {
                      // _logger.d('Submitting form...');
                      // var formState = _formKey.currentState;
                      // formState?.save();
                      // var params = _converter.convert(formState!.fields);
                      // var bloc = BlocProvider.of<ProfilesBloc>(context);
                      // bloc.add(LoadProfilesEvent(params: params));
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
