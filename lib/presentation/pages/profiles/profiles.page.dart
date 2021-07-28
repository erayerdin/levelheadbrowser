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
import 'package:levelheadbrowser/logic/appbar/appbar_cubit.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/logic/profiles/profiles_bloc.dart';
import 'package:levelheadbrowser/presentation/components/filterpanel/filterpanel.component.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/components/profilecard.component.dart';
import 'package:tuple/tuple.dart';

const Tuple2<int, int> SUBS_COUNT = Tuple2(0, 10000);
const Tuple2<int, int> PLAYTIME_SECS = Tuple2(0, 10000);

const SORT_BY_DROPDOWN_ITEMS = [
  DropdownMenuItem(
    child: Text('Earliest Joined'),
    value: Tuple2(false, PlayerParamsSortField.DateJoined),
  ),
  DropdownMenuItem(
    child: Text('Latest Joined'),
    value: Tuple2(true, PlayerParamsSortField.DateJoined),
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

class ProfilesPage extends StatelessWidget {
  final Converter<
      Map<String, FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>,
      PlayersParams> _converter = getIt.get(
    instanceName: 'data.converters.forms.fromProfileFilterForm.toPlayersParams',
  );

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppBarCubit>(context).emit(AppBarState(title: 'Profiles'));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocCtx) => ProfilesBloc()
            ..add(
              LoadProfilesEvent(
                params: BlocProvider.of<HomePageBloc>(context).state.params ??
                    PlayersParams(),
              ),
            ),
        ),
      ],
      child: BlocBuilder<ProfilesBloc, ProfilesState>(
        builder: (context, state) {
          if (state is FailedProfilesState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is LoadedProfilesState) {
            return FilterPanel(
              formHeader: Text(
                'Filter Profiles',
                style: Theme.of(context).textTheme.headline6,
              ),
              formChildren: [
                Text(
                  'Subscribers',
                  style: Theme.of(context).textTheme.headline6,
                ),
                FormBuilderRangeSlider(
                  name: 'subscriberCount',
                  min: SUBS_COUNT.item1.toDouble(),
                  max: SUBS_COUNT.item2.toDouble(),
                  initialValue: RangeValues(
                    SUBS_COUNT.item1.toDouble(),
                    SUBS_COUNT.item2.toDouble(),
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                Text(
                  'Sort by',
                  style: Theme.of(context).textTheme.headline6,
                ),
                FormBuilderDropdown(
                  name: 'sortBy',
                  items: SORT_BY_DROPDOWN_ITEMS,
                  allowClear: true,
                ),
              ],
              onApply: (form) {
                var formState = form.currentState;
                formState?.save();
                var params = _converter.convert(formState!.fields);
                BlocProvider.of<ProfilesBloc>(context)
                  ..add(LoadProfilesEvent(params: params));
              },
              body: OrientationBuilder(
                builder: (context, orientation) => GridView.count(
                  crossAxisCount: orientation == Orientation.landscape ? 4 : 2,
                  childAspectRatio: 1.3,
                  children: state.profiles
                      .map((e) => ProfileCardComponent(profile: e))
                      .toList(),
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
