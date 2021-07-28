// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

class NavDrawerTileComponent extends StatelessWidget {
  final Icon? icon;
  final String label;
  final Function()? onTap;

  const NavDrawerTileComponent({
    Key? key,
    this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null) icon!,
          SizedBox(width: 10),
          Text(label),
        ],
      ),
      onTap: onTap,
    );
  }
}
