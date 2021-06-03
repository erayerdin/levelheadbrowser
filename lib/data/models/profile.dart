// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:equatable/equatable.dart';

class TipStats {
  final num? perLevel;
  final num? perDay;

  TipStats({
    required this.perLevel,
    required this.perDay,
  });
}

class ProfileStats {
  final int? subscriberCount;
  final int? followingCount;
  final int? crownCount;
  final int? shoeCount;
  final int? playtimeSeconds;
  final TipStats tipsCount;
  final TipStats tippedCount;
  final int hiddenGemCount;
  final int trophyCount;
  final int? perkPoints;
  final int? campaignProgress;
  final int? timeTrophyCount;

  ProfileStats({
    required this.subscriberCount,
    required this.followingCount,
    required this.crownCount,
    required this.shoeCount,
    required this.playtimeSeconds,
    required this.tipsCount,
    required this.tippedCount,
    required this.hiddenGemCount,
    required this.trophyCount,
    required this.perkPoints,
    required this.campaignProgress,
    required this.timeTrophyCount,
  });
}

class Profile extends Equatable {
  final String id;
  final DateTime dateJoined;
  final String? alias;
  final String? avatar;
  final ProfileStats stats;

  Profile({
    required this.id,
    required this.dateJoined,
    required this.alias,
    this.avatar,
    required this.stats,
  });

  String getAvatarURL({int height = 100, bool isWebP = true}) {
    return 'https://img.bscotch.net/fit-in/${height}x$height/avatars/$avatar.${isWebP ? "webp" : "png"}';
  }

  @override
  List<Object?> get props => [id];
}
