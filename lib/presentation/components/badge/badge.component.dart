// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

extension HexColor on Color {
  // REF https://stackoverflow.com/a/61186997/2926992
  String toHex({bool leadingHashSign = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

enum BadgeStyle {
  Flat,
  FlatSquare,
}

extension BadgeStyleExtension on BadgeStyle {
  String toValue() {
    switch (this) {
      case BadgeStyle.Flat:
        return 'flat';
      case BadgeStyle.FlatSquare:
        return 'flat-square';
    }
  }
}

class Badge {
  final String? title;
  final String message;
  final BadgeStyle style;
  final Color color;

  String get url {
    var titleVal = title == null ? '' : title;
    var messageVal = message.replaceAll('-', '--');
    var colorVal = color.toHex();
    var styleVal = style.toValue();
    return 'https://raster.shields.io/badge/$titleVal-$messageVal-$colorVal?style=$styleVal';
  }

  Badge({
    this.title,
    required this.message,
    this.style = BadgeStyle.Flat,
    this.color = Colors.green,
  });
}

class BadgeComponent extends StatelessWidget {
  final Logger _logger = getIt.get();

  final Badge badge;

  BadgeComponent({
    Key? key,
    required this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.v('badge url: ${badge.url}');
    return CachedNetworkImage(
      imageUrl: badge.url,
      placeholder: (context, url) =>
          Image.asset('images/badges/loading-badge.png'),
      errorWidget: (context, url, error) =>
          Image.asset('images/badges/error-badge.png'),
    );
  }
}
