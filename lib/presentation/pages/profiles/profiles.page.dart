// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/profiles/profiles_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/components/filterdialog.component.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/components/profilecard.component.dart';
import 'package:logger/logger.dart';

class ProfilesPage extends StatelessWidget {
  final Logger _logger = getIt.get();
  final EdgeInsets _padding = getIt.get(instanceName: 'style.space.10');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocCtx) => ProfilesBloc()
            ..add(
              LoadProfilesEvent(
                params: PlayersParams(), // TODO make dynamic with form
              ),
            ),
        ),
      ],
      child: Container(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: BlocBuilder<ProfilesBloc, ProfilesState>(
                builder: (context, state) {
                  if (state is LoadingProfilesState) {
                    return ElevatedButton(
                      onPressed: null,
                      child: Text('Filter'),
                    );
                  }

                  return ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: ProfileFilterDialog(),
                        ),
                      );
                    },
                    child: Text('Filter'),
                  );
                },
              ),
            ),
            BlocBuilder<ProfilesBloc, ProfilesState>(
              builder: (context, state) {
                if (state is FailedProfilesState) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else if (state is LoadedProfilesState) {
                  return Expanded(
                    child: ListView(
                      children: state.profiles
                          .map((e) => ProfileCardComponent(profile: e))
                          .toList(),
                    ),
                  );
                }

                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
