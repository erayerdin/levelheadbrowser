// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:timeago/timeago.dart' as timeago;

const _MAX_SUBS_LIMIT = 7500;

class ProfileCardComponent extends StatelessWidget {
  final EdgeInsets _margin = getIt.get(instanceName: 'style.space.10');

  final Profile profile;

  ProfileCardComponent({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: Theme.of(context).cardTheme.copyWith(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        textTheme: Theme.of(context).textTheme.copyWith(
              subtitle1: TextStyle(
                color: Colors.white,
              ),
              caption: TextStyle(
                color: Colors.white,
              ),
            ),
      ),
      child: Builder(
        builder: (context) => Card(
          color: Color.lerp(
              Colors.red,
              Colors.green,
              profile.stats.subscriberCount == null
                  ? 0
                  : profile.stats.subscriberCount! / _MAX_SUBS_LIMIT),
          child: Container(
              margin: _margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    profile.alias,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Joined ${timeago.format(profile.dateJoined)}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          'Has ${profile.stats.subscriberCount} subscribers',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          'Following ${profile.stats.followingCount} people',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
