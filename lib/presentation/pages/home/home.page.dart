// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/dailybuild/dailybuild.page.dart';
import 'package:levelheadbrowser/presentation/pages/levels/levels.page.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/profiles.page.dart';
import 'package:levelheadbrowser/presentation/pages/towertrials/towertrials.page.dart';

part 'bottomnavbar.component.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocCtx) => HomePageBloc()
            ..add(
              LoadHomePageEvent(index: HomePageBottomNavbarTab.Profiles.index),
            ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('LevelHead Browser'),
        ),
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is HomePageProfilesTabState) {
              return ProfilesPage();
            } else if (state is HomePageTowerTrialTabState) {
              return TowerTrialsPage();
            } else if (state is HomePageLevelsTabState) {
              return LevelsPage();
            }

            return ProfilesPage();
          },
        ),
        bottomNavigationBar: _BottomNavbarComponent(),
      ),
    );
  }
}
