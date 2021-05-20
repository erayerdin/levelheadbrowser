// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/utils/serializer/deserailizer.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

class RumpusProfileDeserializer
    implements Deserializer<Profile, Map<String, dynamic>> {
  final Logger _logger = getIt.get();

  @override
  Future<Profile> deserialize(Map<String, dynamic> data) async {
    _logger.d('Deserializing using RumpusProfileDeserializer...');
    _logger.v('data: $data');

    return Profile(
      id: data['userId'],
      dateJoined: DateTime.parse(data['createdAt']),
      alias: data['alias']['alias'],
      stats: ProfileStats(
        subscriberCount: data['stats']['Subscribers'],
        followingCount: data['stats']['NumFollowing'],
        crownCount: data['stats']['Crowns'],
        shoeCount: data['stats']['Shoes'],
        playtimeSeconds: data['stats']['PlayTime'],
        tipsCount: TipStats(
          perLevel: data['stats']['TipsPerLevel'],
          perDay: data['stats']['TipsPerDay'],
        ),
        tippedCount: TipStats(
          perLevel: data['stats']['TippedPerLevelPlayed'],
          perDay: data['stats']['TippedPerDay'],
        ),
        hiddenGemCount: data['stats']['HiddenGem'],
        trophyCount: data['stats']['Trophies'],
        perkPoints: data['stats']['PerkPoints'],
        campaignProgress: data['stats']['CampaignProg'],
        timeTrophyCount: data['stats']['TimeTrophies'],
      ),
    );
  }
}
