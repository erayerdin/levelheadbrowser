// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/levels/components/leveldialog/leveldialog.component.dart';
import 'package:logger/logger.dart' show Logger;

double _getInterpolationValue(
    LevelCardColorInterpolationField field, Level level) {
  Logger _logger = getIt.get();
  _logger.d('Computing interpolation value for level...');
  _logger.v('field: $field');
  _logger.v('level: $level');

  switch (field) {
    case LevelCardColorInterpolationField.InTower:
      return level.inTower ? 1 : 0 / field.max;
    case LevelCardColorInterpolationField.InTowerTrial:
      return level.inTowerTrial ? 1 : 0 / field.max;
    case LevelCardColorInterpolationField.InDailyBuild:
      return level.inDailyBuild ? 1 : 0 / field.max;
    case LevelCardColorInterpolationField.RequiredPlayerCount:
      return level.requiredPlayerCount / field.max;
    case LevelCardColorInterpolationField.AttemptCount:
      return level.stats.attemptCount / field.max;
    case LevelCardColorInterpolationField.PlayerCount:
      return level.stats.playerCount / field.max;
    case LevelCardColorInterpolationField.SuccessCount:
      return level.stats.successCount / field.max;
    case LevelCardColorInterpolationField.ClearRate:
      return level.stats.clearRate / field.max;
    case LevelCardColorInterpolationField.FailureRate:
      return level.stats.failureRate / field.max;
    case LevelCardColorInterpolationField.FavoriteCount:
      return (level.stats.favoriteCount ?? 0 / field.max).floorToDouble();
    case LevelCardColorInterpolationField.LikeCount:
      return (level.stats.likeCount ?? 0 / field.max).floorToDouble();
    case LevelCardColorInterpolationField.PlaytimeSeconds:
      return level.stats.playTimeSeconds / field.max;
    case LevelCardColorInterpolationField.ReplayValue:
      return level.stats.replayValue / field.max;
    case LevelCardColorInterpolationField.ExposureBucks:
      return level.stats.exposureBucks / field.max;
  }
}

class LevelCardComponent extends StatelessWidget {
  final Level level;

  LevelCardComponent({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is LoadedSettingsState) {
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
                    bodyText2: TextStyle(
                      color: Colors.white,
                    ),
                    caption: TextStyle(
                      color: Colors.white,
                    ),
                  ),
              iconTheme: Theme.of(context).iconTheme.copyWith(
                    color: Colors.white,
                  ),
            ),
            child: Builder(
              builder: (context) => GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<HomePageBloc>(context),
                    child: LevelDialog(level: level),
                  ),
                ),
                child: Card(
                  color: Color.lerp(
                    state.settings.card.levelCard.minColor,
                    state.settings.card.levelCard.maxColor,
                    _getInterpolationValue(
                      state.settings.card.levelCard.colorInterpolationField,
                      level,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: level.getAvatarURL(),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    level.title,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('Not Implement Yet'),
                                          ),
                                        );
                                      }, // TODO implement like button
                                    ),
                                    Text(
                                      level.stats.likeCount == null
                                          ? '0'
                                          : level.stats.likeCount.toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.star_outline_outlined),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('Not Implement Yet'),
                                          ),
                                        );
                                      }, // TODO implement favorite button
                                    ),
                                    Text(
                                      level.stats.favoriteCount == null
                                          ? '0'
                                          : level.stats.favoriteCount
                                              .toString(),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
