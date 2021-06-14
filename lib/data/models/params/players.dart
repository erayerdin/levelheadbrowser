// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:tuple/tuple.dart';

enum PlayersParamsSortField {
  DateJoined,
  SubscribeCount,
  PlaytimeSeconds,
  PlayCount,
  TrophyCount,
  ShoeCount,
  CrownCount,
  PublishCount,
}

extension PlayersParamsSortFieldExtension on PlayersParamsSortField {
  String get value {
    switch (this) {
      case PlayersParamsSortField.DateJoined:
        return 'createdAt';
      case PlayersParamsSortField.SubscribeCount:
        return 'Subscribers';
      case PlayersParamsSortField.PlaytimeSeconds:
        return 'PlayTime';
      case PlayersParamsSortField.PlayCount:
        return 'Plays';
      case PlayersParamsSortField.TrophyCount:
        return 'Trophies';
      case PlayersParamsSortField.ShoeCount:
        return 'Shoes';
      case PlayersParamsSortField.CrownCount:
        return 'Crowns';
      case PlayersParamsSortField.PublishCount:
        return 'Published';
    }
  }
}

class PlayersParams {
  final Set<String>? ids;
  final Tuple2<bool, PlayersParamsSortField>? sort;
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
