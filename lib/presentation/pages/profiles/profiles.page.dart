// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/components/profilecard.component.dart';

// TODO to be removed
final DEVPROFILES = [
  Profile(
    id: 'foobar',
    dateJoined: DateTime.now(),
    alias: 'FooBar',
    stats: ProfileStats(
      subscriberCount: 0,
      followingCount: 0,
      crownCount: 0,
      shoeCount: 0,
      playtimeSeconds: 0,
      tipsCount: TipStats(perLevel: 0, perDay: 0),
      tippedCount: TipStats(perLevel: 0, perDay: 0),
      hiddenGemCount: 0,
      trophyCount: 0,
      perkPoints: 0,
      campaignProgress: 0,
      timeTrophyCount: 0,
    ),
  ),
  Profile(
    id: 'foobar',
    dateJoined: DateTime.now(),
    alias: 'FooBar',
    stats: ProfileStats(
      subscriberCount: 0,
      followingCount: 0,
      crownCount: 0,
      shoeCount: 0,
      playtimeSeconds: 0,
      tipsCount: TipStats(perLevel: 0, perDay: 0),
      tippedCount: TipStats(perLevel: 0, perDay: 0),
      hiddenGemCount: 0,
      trophyCount: 0,
      perkPoints: 0,
      campaignProgress: 0,
      timeTrophyCount: 0,
    ),
  ),
  Profile(
    id: 'foobar',
    dateJoined: DateTime.now(),
    alias: 'FooBar',
    stats: ProfileStats(
      subscriberCount: 0,
      followingCount: 0,
      crownCount: 0,
      shoeCount: 0,
      playtimeSeconds: 0,
      tipsCount: TipStats(perLevel: 0, perDay: 0),
      tippedCount: TipStats(perLevel: 0, perDay: 0),
      hiddenGemCount: 0,
      trophyCount: 0,
      perkPoints: 0,
      campaignProgress: 0,
      timeTrophyCount: 0,
    ),
  ),
  Profile(
    id: 'foobar',
    dateJoined: DateTime.now(),
    alias: 'FooBar',
    stats: ProfileStats(
      subscriberCount: 0,
      followingCount: 0,
      crownCount: 0,
      shoeCount: 0,
      playtimeSeconds: 0,
      tipsCount: TipStats(perLevel: 0, perDay: 0),
      tippedCount: TipStats(perLevel: 0, perDay: 0),
      hiddenGemCount: 0,
      trophyCount: 0,
      perkPoints: 0,
      campaignProgress: 0,
      timeTrophyCount: 0,
    ),
  ),
  Profile(
    id: 'foobar',
    dateJoined: DateTime.now(),
    alias: 'FooBar',
    stats: ProfileStats(
      subscriberCount: 0,
      followingCount: 0,
      crownCount: 0,
      shoeCount: 0,
      playtimeSeconds: 0,
      tipsCount: TipStats(perLevel: 0, perDay: 0),
      tippedCount: TipStats(perLevel: 0, perDay: 0),
      hiddenGemCount: 0,
      trophyCount: 0,
      perkPoints: 0,
      campaignProgress: 0,
      timeTrophyCount: 0,
    ),
  ),
];

class ProfilesPage extends StatelessWidget {
  final EdgeInsets _padding = getIt.get(instanceName: 'style.space.10');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Filter'),
            ),
          ),
          Expanded(
            child: ListView(
              children: DEVPROFILES
                  .map((e) => ProfileCardComponent(profile: e))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
