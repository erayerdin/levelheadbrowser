// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/logic/towertrials/towertrials_bloc.dart';
import 'package:levelheadbrowser/presentation/components/filterpanel/filterpanel.component.dart';
import 'package:levelheadbrowser/presentation/pages/levels/components/levelcard.component.dart';

class TowerTrialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocCtx) => TowerTrialsBloc()
            ..add(
              LoadTowerTrialsEvent(),
            ),
        ),
      ],
      child: BlocBuilder<TowerTrialsBloc, TowerTrialsState>(
        builder: (context, state) {
          if (state is LoadedTowerTrialsState) {
            return FilterPanel(
              body: ListView(
                children: state.towerTrial.levels
                    .map((e) => LevelCardComponent(level: e))
                    .toList(),
              ),
              formHeader: Text('Records'), // TODO add form header
              formChildren: [], // TODO add form children
              onApply: (form) {}, // TODO implement form onApply
              showButtons: false,
            );
          } else if (state is FailedLoadingTowerTrialsState) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
