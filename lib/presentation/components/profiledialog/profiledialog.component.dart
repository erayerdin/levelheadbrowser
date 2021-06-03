// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/di.dart';

const _TABLE_ROW_MARGIN = EdgeInsets.fromLTRB(10, 5, 10, 5);

TableRow _mapProfileFieldToTableRow(
    BuildContext context, String label, dynamic object) {
  return TableRow(
    children: [
      Container(
        margin: _TABLE_ROW_MARGIN,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.right,
        ),
      ),
      Container(
        margin: _TABLE_ROW_MARGIN,
        child: Text(
          object.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

class ProfileDialog extends StatelessWidget {
  final EdgeInsets _margin = getIt.get(instanceName: 'style.space.10');

  final Profile profile;

  ProfileDialog({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: _margin,
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: profile.getAvatarURL(),
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${profile.alias == null ? "<no alias>" : profile.alias}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(),
                  Theme(
                    data: Theme.of(context).copyWith(
                      textTheme: Theme.of(context).textTheme.copyWith(
                              bodyText1: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    child: Table(
                      children: [
                        _mapProfileFieldToTableRow(context, 'ID:', profile.id),
                        _mapProfileFieldToTableRow(
                            context, 'Alias:', profile.alias),
                        _mapProfileFieldToTableRow(
                          context,
                          'Date Joined:',
                          profile.dateJoined,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Subscribers:',
                          profile.stats.subscriberCount,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Following:',
                          profile.stats.followingCount,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Crowns:',
                          profile.stats.crownCount,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Playtime:',
                          profile.stats.playtimeSeconds,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Tips (Per Level):',
                          profile.stats.tipsCount.perLevel,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Tips (Per Day):',
                          profile.stats.tipsCount.perDay,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Tipped (Per Level):',
                          profile.stats.tipsCount.perLevel,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Tipped (Per Day):',
                          profile.stats.tipsCount.perDay,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Hidden Gems:',
                          profile.stats.hiddenGemCount,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Trophies:',
                          profile.stats.trophyCount,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Perk Points:',
                          profile.stats.perkPoints,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Campaign Progress:',
                          profile.stats.campaignProgress,
                        ),
                        _mapProfileFieldToTableRow(
                          context,
                          'Time Trophies:',
                          profile.stats.timeTrophyCount,
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
