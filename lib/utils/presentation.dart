// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

Widget buildSection(BuildContext context, String label, Widget widget) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headline6,
        ),
        widget,
      ],
    ),
  );
}
