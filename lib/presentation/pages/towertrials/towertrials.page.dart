// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:levelheadbrowser/data/models/towertrial.dart';
import 'package:levelheadbrowser/logic/towertrials/towertrials_bloc.dart';
import 'package:levelheadbrowser/presentation/components/filterpanel/filterpanel.component.dart';
import 'package:levelheadbrowser/presentation/pages/levels/components/levelcard.component.dart';

class _RecordTable extends StatelessWidget {
  final TowerTrial towerTrial;
  final bool isFastestTime;

  const _RecordTable({
    Key? key,
    required this.towerTrial,
    required this.isFastestTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        children: [
          Text(
            isFastestTime ? 'Fastest Time Records' : 'High Score Records',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 5),
          Table(
            children: (isFastestTime
                    ? towerTrial.fastestTimeRecords
                    : towerTrial.highScoreRecords)
                .map(
              (e) {
                var duration = Duration(seconds: e.value.toDouble().floor());
                var hours = duration.inHours;
                var minutes = duration.inMinutes.remainder(60);
                var seconds = duration.inSeconds.remainder(60);
                var valueText =
                    '${hours > 0 ? "$hours hrs " : ""}$minutes mins $seconds secs';

                return TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        e.profile.alias ?? '<no-alias>',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(valueText),
                    ),
                  ],
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}

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
              formHeader: Text(
                'Records',
                style: Theme.of(context).textTheme.headline6,
              ),
              formChildren: [
                // TODO apply side-by-side
                // couldn't do that for some reason
                _RecordTable(towerTrial: state.towerTrial, isFastestTime: true),
              ],
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
