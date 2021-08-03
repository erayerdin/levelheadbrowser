// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/data/constants.dart';
import 'package:levelheadbrowser/logic/appbar/appbar_cubit.dart';
import 'package:levelheadbrowser/logic/firstrun/firstrun_cubit.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/presentation/components/navdrawer/section.component.dart';
import 'package:levelheadbrowser/presentation/components/navdrawer/tile.component.dart';
import 'package:levelheadbrowser/presentation/pages/home/components/btg/btgdialog.component.dart';
import 'package:levelheadbrowser/presentation/pages/levels/levels.page.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/profiles.page.dart';
import 'package:levelheadbrowser/presentation/pages/towertrials/towertrials.page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'drawer.part.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocCtx) => HomePageBloc(BlocProvider.of(context))
            ..add(
              LoadHomePageEvent(index: 0),
            ),
        ),
        BlocProvider(create: (context) => AppBarCubit()),
      ],
      child: Builder(
        builder: (context) => BlocListener<FirstRunCubit, bool>(
          listener: (context, state) {
            if (state) Navigator.pushNamed(context, "/intro");
          },
          child: Scaffold(
            appBar: AppBar(
              title: BlocBuilder<AppBarCubit, AppBarState?>(
                builder: (context, state) {
                  return Text(state?.title ?? 'Levelhead Browser');
                },
              ),
            ),
            drawer: NavDrawer(),
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
          ),
        ),
      ),
    );
  }
}
