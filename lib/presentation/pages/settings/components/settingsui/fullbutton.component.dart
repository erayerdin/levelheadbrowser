// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

class FullButtonComponent extends StatelessWidget {
  final String label;
  final String? helpText;
  final Function() onTap;

  FullButtonComponent({
    Key? key,
    required this.label,
    this.helpText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                if (helpText != null)
                  Text(
                    helpText!,
                    style: Theme.of(context).textTheme.caption,
                  )
              ],
            ),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}