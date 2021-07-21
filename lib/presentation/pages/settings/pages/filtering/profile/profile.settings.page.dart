// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/profiles.page.dart';
import 'package:tuple/tuple.dart';

class DefaultProfileFilteringSettingsPage extends StatelessWidget {
  final Converter<Tuple2<num, num>, RangeValues> _tuple2RangeValuesConverter =
      getIt.get(instanceName: 'data.converters.utils.toRangeValues.fromTuple2');

  final _formKey = GlobalKey<FormBuilderState>();

  DefaultProfileFilteringSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Default Profile Filtering Settings'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              FormBuilderDropdown(
                name: 'sortBy',
                decoration: InputDecoration(labelText: 'Default Sorting'),
                items: SORT_BY_DROPDOWN_ITEMS,
                initialValue: settingsBloc.settings.defaultFiltering
                    .defaultProfilesPageFiltering.sortBy,
                allowClear: true,
              ),
              FormBuilderRangeSlider(
                name: 'subscriberCount',
                decoration: InputDecoration(labelText: 'Subscriber Count'),
                min: SUBS_COUNT.item1.floorToDouble(),
                max: SUBS_COUNT.item2.floorToDouble(),
                initialValue: _tuple2RangeValuesConverter.convert(
                  settingsBloc.settings.defaultFiltering
                          .defaultProfilesPageFiltering.subscriberCount ??
                      SUBS_COUNT,
                ),
              ),
              FormBuilderRangeSlider(
                name: 'playtimeSeconds',
                decoration: InputDecoration(labelText: 'Playtime'),
                min: PLAYTIME_SECS.item1.floorToDouble(),
                max: PLAYTIME_SECS.item2.floorToDouble(),
                initialValue: _tuple2RangeValuesConverter.convert(
                  settingsBloc.settings.defaultFiltering
                          .defaultProfilesPageFiltering.playtimeSeconds ??
                      PLAYTIME_SECS,
                ), // TODO impl initial value
              ),
            ],
          ),
        ),
      ),
    );
  }
}
