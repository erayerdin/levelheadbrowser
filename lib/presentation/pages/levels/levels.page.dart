// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/logic/levels/levels_bloc.dart';

class LevelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (blocCtx) => LevelsBloc()..add(LoadLevelsEvent()))
      ],
      child: Container(
        child: BlocBuilder<LevelsBloc, LevelsState>(
          builder: (context, state) {
            if (state is LoadingLevelsState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FailedLoadingLevelsState) {
              return Center(child: Text(state.message));
            }
            return Center(
              child: Text('Hello from Levels page.'),
            );
          },
        ),
      ),
    );
  }
}
