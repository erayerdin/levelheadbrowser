// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:levelheadbrowser/logic/firstrun/firstrun_cubit.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/levels/levels.page.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/profiles.page.dart';
import 'package:levelheadbrowser/presentation/pages/towertrials/towertrials.page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: BlocListener<FirstRunCubit, bool>(
        listener: (context, state) {
          if (state) Navigator.pushNamed(context, "/intro");
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Levelhead Browser'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('About'),
                    value: 'about',
                  )
                ],
                onSelected: (item) async {
                  switch (item) {
                    case 'about':
                      var info = await PackageInfo.fromPlatform();
                      showAboutDialog(
                          context: context,
                          applicationVersion: info.version,
                          applicationIcon: ClipRRect(
                            child: Image.asset(
                              'assets/images/icons/icon.png',
                              width: 50,
                              height: 50,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          applicationLegalese:
                              'An application to browser Levelhead world.',
                          children: [
                            MarkdownBody(
                              data:
                                  'Follow me on [Twitter](https://twitter.com/_erayerdin), '
                                  '[Github](https://github.com/erayerdin) or '
                                  '[Telegram](https://t.me/erayerdin).',
                              onTapLink: (_, href, __) async =>
                                  await canLaunch(href!)
                                      ? await launch(href)
                                      : '',
                            ),
                          ]);
                  }
                },
              )
            ],
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
      ),
    );
  }
}
