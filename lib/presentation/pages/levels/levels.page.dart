// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/levels/levels_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/levels/components/filterpanel.component.dart';
import 'package:levelheadbrowser/presentation/pages/levels/components/levelcard.component.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LevelsPage extends StatelessWidget {
  final EdgeInsets _padding = getIt.get(instanceName: 'style.space.10');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (blocCtx) => LevelsBloc()..add(LoadLevelsEvent()))
      ],
      child: BlocBuilder<LevelsBloc, LevelsState>(
        builder: (context, state) {
          if (state is LoadedLevelsState) {
            return SlidingUpPanel(
              backdropEnabled: true,
              minHeight: 25,
              collapsed: Icon(Icons.keyboard_arrow_up),
              panel: LevelFilterPanel(),
              body: Container(
                // TODO fix, body is not fully visible because panel covers it
                padding: _padding,
                child: ListView(
                  children: state.levels
                      .map((e) => LevelCardComponent(level: e))
                      .toList(),
                ),
              ),
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
