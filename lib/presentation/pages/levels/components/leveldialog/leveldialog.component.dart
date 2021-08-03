// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/presentation/components/badge/badge.component.dart';
import 'package:levelheadbrowser/presentation/components/link/link.component.dart';
import 'package:share_plus/share_plus.dart';

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
          child: ListView(
            children: [
              Container(
                margin: _margin,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 90),
                        CachedNetworkImage(
                          imageUrl: level.getAvatarURL(),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Share.share('lhbr://level/${level.id}');
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text: 'lhbr://level/${level.id}'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Copied to clipboard.'),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icon(Icons.copy, color: Colors.black)),
                          ],
                        ),
                      ],
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
