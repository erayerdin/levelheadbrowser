// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/profiles/profiles_bloc.dart';
import 'package:levelheadbrowser/utils/presentation.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

const Tuple2<int, int> SUBS_COUNT = Tuple2(0, 10000);
const Tuple2<int, int> PLAYTIME_SECS = Tuple2(0, 10000);

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
    value: Tuple2(false, PlayerParamsSortField.SubscribeCount),
  ),
  DropdownMenuItem(
    child: Text('Least Subscribers'),
    value: Tuple2(true, PlayerParamsSortField.SubscribeCount),
  ),
  DropdownMenuItem(
    child: Text('Most Playtime'),
    value: Tuple2(false, PlayerParamsSortField.PlaytimeSeconds),
  ),
  DropdownMenuItem(
    child: Text('Least Playtime'),
    value: Tuple2(true, PlayerParamsSortField.PlaytimeSeconds),
  ),
  DropdownMenuItem(
    child: Text('Most Levels Played'),
    value: Tuple2(false, PlayerParamsSortField.PlayCount),
  ),
  DropdownMenuItem(
    child: Text('Least Levels Played'),
    value: Tuple2(true, PlayerParamsSortField.PlayCount),
  ),
  DropdownMenuItem(
    child: Text('Most Trophies'),
    value: Tuple2(false, PlayerParamsSortField.TrophyCount),
  ),
  DropdownMenuItem(
    child: Text('Least Trophies'),
    value: Tuple2(true, PlayerParamsSortField.TrophyCount),
  ),
  DropdownMenuItem(
    child: Text('Most Shoes'),
    value: Tuple2(false, PlayerParamsSortField.ShoeCount),
  ),
  DropdownMenuItem(
    child: Text('Least Shoes'),
    value: Tuple2(true, PlayerParamsSortField.ShoeCount),
  ),
  DropdownMenuItem(
    child: Text('Most Crowns'),
    value: Tuple2(false, PlayerParamsSortField.CrownCount),
  ),
  DropdownMenuItem(
    child: Text('Least Crowns'),
    value: Tuple2(true, PlayerParamsSortField.CrownCount),
  ),
  DropdownMenuItem(
    child: Text('Most Published Levels'),
    value: Tuple2(false, PlayerParamsSortField.PublishCount),
  ),
  DropdownMenuItem(
    child: Text('Least Published Levels'),
    value: Tuple2(true, PlayerParamsSortField.PublishCount),
  ),
];

class ProfileFilterDialog extends StatelessWidget {
  final Logger _logger = getIt.get();
  final Converter<
      Map<String, FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>,
      PlayersParams> _converter = getIt.get(
    instanceName: 'data.converters.forms.fromProfileFilterForm.toPlayersParams',
  );

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
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
                  buildSection(
                    context,
                    'Subscribers',
                    FormBuilderRangeSlider(
                      name: 'subscriberCount',
                      min: SUBS_COUNT.item1.toDouble(),
                      max: SUBS_COUNT.item2.toDouble(),
                      initialValue: RangeValues(
                        SUBS_COUNT.item1.toDouble(),
                        SUBS_COUNT.item2.toDouble(),
                      ),
                    ),
                  ),
                  buildSection(
                    context,
                    'Playtime (in secs)',
                    FormBuilderRangeSlider(
                      name: 'playtimeSeconds',
                      min: PLAYTIME_SECS.item1.toDouble(),
                      max: PLAYTIME_SECS.item2.toDouble(),
                      initialValue: RangeValues(
                        PLAYTIME_SECS.item1.toDouble(),
                        PLAYTIME_SECS.item2.toDouble(),
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
                            _logger.d('Submitting form...');
                            var formState = _formKey.currentState;
                            formState?.save();
                            var params = _converter.convert(formState!.fields);
                            var bloc = BlocProvider.of<ProfilesBloc>(context);
                            bloc.add(LoadProfilesEvent(params: params));
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
          ),
        ],
      ),
    );
  }
}
