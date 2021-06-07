// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/presentation/components/badge/badge.component.dart';
import 'package:levelheadbrowser/presentation/components/link/link.component.dart';

part 'header.component.dart';
part 'body.component.dart';
part 'footer.component.dart';

class LevelDialog extends StatelessWidget {
  final EdgeInsets _margin = getIt.get(instanceName: 'style.space.10');

  final Level level;

  LevelDialog({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText2: TextStyle(color: Colors.black),
            ),
      ),
      child: Builder(
        builder: (context) => Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: _margin,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: level.getAvatarURL(),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(height: 10),
                    Text(
                      level.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10),
                    _HeaderComponent(level: level),
                    Divider(),
                    _BodyComponent(level: level),
                    Divider(),
                    _FooterComponent(level: level),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
