// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkComponent extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign? align;
  final Function()? onTap;

  const LinkComponent(
    this.text, {
    Key? key,
    this.color = Colors.blue,
    this.align,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: align ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: text,
        style: TextStyle(color: color),
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ),
    );
  }
}
