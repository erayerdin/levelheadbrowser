// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

class RumpusMapToProfileConverter
    extends Converter<Map<String, dynamic>, Profile> {
  final Logger _logger = getIt.get();

  @override
  Profile convert(Map<String, dynamic> input) {
    _logger.d('Converting LevelHead profile data to Profile object...');
    _logger.v('input: $input');

    return Profile(
      id: input['userId'],
      dateJoined: DateTime.parse(input['createdAt']),
      alias: (input['alias'] ?? Map())['alias'],
      avatar: (input['alias'] ?? Map())['avatarId'],
      stats: ProfileStats(
        subscriberCount: input['stats']['Subscribers'],
        followingCount: input['stats']['NumFollowing'],
        crownCount: input['stats']['Crowns'],
        shoeCount: input['stats']['Shoes'],
        playtimeSeconds: input['stats']['PlayTime'],
        tipsCount: TipStats(
          perLevel: input['stats']['TipsPerLevel'],
          perDay: input['stats']['TipsPerDay'],
        ),
        tippedCount: TipStats(
          perLevel: input['stats']['TippedPerLevelPlayed'],
          perDay: input['stats']['TippedPerDay'],
        ),
        hiddenGemCount: input['stats']['HiddenGem'],
        trophyCount: input['stats']['Trophies'],
        perkPoints: input['stats']['PerkPoints'],
        campaignProgress: input['stats']['CampaignProg'],
        timeTrophyCount: input['stats']['TimeTrophies'],
      ),
    );
  }
}
