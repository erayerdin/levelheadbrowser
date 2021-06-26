// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/levels/levels_bloc.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/components/filterpanel/filterpanel.component.dart';
import 'package:levelheadbrowser/presentation/pages/levels/components/levelcard.component.dart';
import 'package:tuple/tuple.dart';

const Tuple2<int, int> PLAYTIME_SECS = Tuple2(0, 100000);
const Tuple2<int, int> BUCKS = Tuple2(0, 1000000);
const Tuple2<int, int> REPLAY = Tuple2(0, 10000);

const SORT_BY_DROPDOWN_ITEMS = [
  DropdownMenuItem(
    child: Text('Earliest Created'),
    value: Tuple2(true, LevelsParamsSortField.CreatedAt),
  ),
  DropdownMenuItem(
    child: Text('Latest Created'),
    value: Tuple2(false, LevelsParamsSortField.CreatedAt),
  ),
  DropdownMenuItem(
    child: Text('Most Playtime'),
    value: Tuple2(true, LevelsParamsSortField.PlaytimeSeconds),
  ),
  DropdownMenuItem(
    child: Text('Least Playtime'),
    value: Tuple2(false, LevelsParamsSortField.PlaytimeSeconds),
  ),
  DropdownMenuItem(
    child: Text('Most Replayed'),
    value: Tuple2(true, LevelsParamsSortField.ReplayValue),
  ),
  DropdownMenuItem(
    child: Text('Least Replayed'),
    value: Tuple2(false, LevelsParamsSortField.ReplayValue),
  ),
  DropdownMenuItem(
    child: Text('Most Exposure Bucks'),
    value: Tuple2(true, LevelsParamsSortField.ExposureBucks),
  ),
  DropdownMenuItem(
    child: Text('Least Playtime'),
    value: Tuple2(false, LevelsParamsSortField.ExposureBucks),
  ),
];

class LevelsPage extends StatelessWidget {
  final Converter<
      Map<String, FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>,
      LevelsParams> _formConverter = getIt.get(
    instanceName: 'data.converters.forms.fromLevelFilterForm.toLevelsParams',
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocCtx) => LevelsBloc()
            ..add(
              LoadLevelsEvent(
                params: LevelsParams(),
              ),
            ),
        ),
      ],
      child: BlocBuilder<LevelsBloc, LevelsState>(
        builder: (context, state) {
          if (state is LoadedLevelsState) {
            return FilterPanel(
              body: ListView(
                children: state.levels
                    .map((e) => LevelCardComponent(level: e))
                    .toList(),
              ),
              formHeader: Text(
                'Filter Levels',
                style: Theme.of(context).textTheme.headline6,
              ),
              formChildren: [
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    if (state is LoadedSettingsState &&
                        state.settings.formAppearance
                            .levelFormAppearanceSettings.enableLocationField) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where Its Located',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          FormBuilderCheckboxGroup(
                            name: 'locations',
                            options: [
                              FormBuilderFieldOption(
                                value: 'inTower',
                                child: Text('In Tower'),
                              ),
                              FormBuilderFieldOption(
                                value: 'inMarketingDepartment',
                                child: Text('In Marketing Department'),
                              ),
                              FormBuilderFieldOption(
                                value: 'inDailyBuild',
                                child: Text('In Daily Build'),
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    return SizedBox();
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    if (state is LoadedSettingsState &&
                        state
                            .settings
                            .formAppearance
                            .levelFormAppearanceSettings
                            .enablePlaytimeSecondsField) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Playtime',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          FormBuilderRangeSlider(
                            name: 'playtimeSeconds',
                            min: PLAYTIME_SECS.item1.toDouble(),
                            max: PLAYTIME_SECS.item2.toDouble(),
                            initialValue: RangeValues(
                              PLAYTIME_SECS.item1.toDouble(),
                              PLAYTIME_SECS.item2.toDouble(),
                            ),
                          ),
                        ],
                      );
                    }

                    return SizedBox();
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    if (state is LoadedSettingsState &&
                        state
                            .settings
                            .formAppearance
                            .levelFormAppearanceSettings
                            .enableExposureBucksField) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bucks',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          FormBuilderRangeSlider(
                            name: 'exposureBucks',
                            min: BUCKS.item1.toDouble(),
                            max: BUCKS.item2.toDouble(),
                            initialValue: RangeValues(
                              BUCKS.item1.toDouble(),
                              BUCKS.item2.toDouble(),
                            ),
                          ),
                        ],
                      );
                    }

                    return SizedBox();
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    if (state is LoadedSettingsState &&
                        state
                            .settings
                            .formAppearance
                            .levelFormAppearanceSettings
                            .enableReplayValueField) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Replay',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          FormBuilderRangeSlider(
                            name: 'replayValue',
                            min: REPLAY.item1.toDouble(),
                            max: REPLAY.item2.toDouble(),
                            initialValue: RangeValues(
                              REPLAY.item1.toDouble(),
                              REPLAY.item2.toDouble(),
                            ),
                          ),
                        ],
                      );
                    }

                    return SizedBox();
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Sort by',
                  style: Theme.of(context).textTheme.headline6,
                ),
                FormBuilderDropdown(
                  name: 'sortBy',
                  items: SORT_BY_DROPDOWN_ITEMS,
                ),
              ],
              onApply: (form) {
                var formState = form.currentState;
                formState?.save();
                var params = _formConverter.convert(formState!.fields);
                BlocProvider.of<LevelsBloc>(context)
                  ..add(LoadLevelsEvent(params: params));
              },
            );
          } else if (state is FailedLoadingLevelsState) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
