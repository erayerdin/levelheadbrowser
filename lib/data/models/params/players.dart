// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:tuple/tuple.dart';

enum PlayerParamsSortField {
  DateJoined,
  SubscribeCount,
  PlaytimeSeconds,
  PlayCount,
  TrophyCount,
  ShoeCount,
  CrownCount,
  PublishCount,
}

extension PlayerParamsSortFieldExtension on PlayerParamsSortField {
  String get value {
    switch (this) {
      case PlayerParamsSortField.DateJoined:
        return 'createdAt';
      case PlayerParamsSortField.SubscribeCount:
        return 'Subscribers';
      case PlayerParamsSortField.PlaytimeSeconds:
        return 'PlayTime';
      case PlayerParamsSortField.PlayCount:
        return 'Plays';
      case PlayerParamsSortField.TrophyCount:
        return 'Trophies';
      case PlayerParamsSortField.ShoeCount:
        return 'Shoes';
      case PlayerParamsSortField.CrownCount:
        return 'Crowns';
      case PlayerParamsSortField.PublishCount:
        return 'Published';
    }
  }
}

class PlayersParams {
  final Set<String>? ids;
  final Tuple2<bool, PlayerParamsSortField>? sort;
  final int? limit;
  final int? minSubscriberCount;
  final int? maxSubscriberCount;
  final int? minPlaytimeSeconds;
  final int? maxPlaytimeSeconds;
  final DateTime? minDateJoined;
  final DateTime? maxDateJoined;

  PlayersParams({
    this.ids,
    this.sort,
    this.limit,
    this.minSubscriberCount,
    this.maxSubscriberCount,
    this.minPlaytimeSeconds,
    this.maxPlaytimeSeconds,
    this.minDateJoined,
    this.maxDateJoined,
  });
}
