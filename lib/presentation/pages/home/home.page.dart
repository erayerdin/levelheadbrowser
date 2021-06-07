// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/dailybuild/dailybuild.page.dart';
import 'package:levelheadbrowser/presentation/pages/levels/levels.page.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/profiles.page.dart';
import 'package:levelheadbrowser/presentation/pages/towertrials/towertrials.page.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Logger _logger = getIt.get();

  int _currentIndexBottomNavbar = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocCtx) =>
              HomePageBloc()..add(LoadHomePageEvent(pageId: 0)),
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
            } else if (state is HomePageDailyBuildTabState) {
              return DailyBuildPage();
            }

            return ProfilesPage();
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) => BottomNavigationBar(
            onTap: (pageId) {
              _logger.d('Pressed $pageId on bottom navbar.');
              BlocProvider.of<HomePageBloc>(context)
                  .add(LoadHomePageEvent(pageId: pageId));
              setState(() {
                _currentIndexBottomNavbar = pageId;
              });
            },
            currentIndex: _currentIndexBottomNavbar,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profiles',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help), // TODO change icon
                label: 'Levels',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help), // TODO change icon
                label: 'Tower Trial',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help), // TODO change icon
                label: 'Daily Build Items',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
