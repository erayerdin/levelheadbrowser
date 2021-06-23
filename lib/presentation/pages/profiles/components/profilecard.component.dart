// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/models/settings.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/components/profiledialog/profiledialog.component.dart';
import 'package:logger/logger.dart';
import 'package:timeago/timeago.dart' as timeago;

const _MAX_SUBS_LIMIT = 7500;

num _getFieldValue(
    ProfileCardColorInterpolationField chosenField, Profile profile) {
  Logger _logger = getIt.get();

  var maxVal = chosenField.range().item2;
  _logger.d('Getting the value of field...');
  _logger.v('chosen field: $chosenField');
  _logger.v('profile: $profile');
  _logger.v('max value: $maxVal');

  switch (chosenField) {
    case ProfileCardColorInterpolationField.SubscriberCount:
      return profile.stats.subscriberCount ?? 0 / maxVal;
    case ProfileCardColorInterpolationField.FollowingCount:
      return profile.stats.followingCount ?? 0 / maxVal;
    case ProfileCardColorInterpolationField.CrownCount:
      return profile.stats.crownCount ?? 0 / maxVal;
    case ProfileCardColorInterpolationField.ShoeCount:
      return profile.stats.shoeCount ?? 0 / maxVal;
    case ProfileCardColorInterpolationField.PlaytimeSeconds:
      return profile.stats.playtimeSeconds ?? 0 / maxVal;
    case ProfileCardColorInterpolationField.HiddenGemCount:
      return profile.stats.hiddenGemCount / maxVal;
    case ProfileCardColorInterpolationField.TrophyCount:
      return profile.stats.trophyCount / maxVal;
    case ProfileCardColorInterpolationField.CampaignProgress:
      return profile.stats.campaignProgress ?? 0 / maxVal;
    case ProfileCardColorInterpolationField.TimeTrophyCount:
      return profile.stats.timeTrophyCount ?? 0 / maxVal;
  }
}

class ProfileCardComponent extends StatelessWidget {
  final EdgeInsets _margin = getIt.get(instanceName: 'style.space.10');

  final Profile profile;

  ProfileCardComponent({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsBloc = BlocProvider.of<SettingsBloc>(context);

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
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Colors.white,
            ),
      ),
      child: Builder(
        builder: (context) => GestureDetector(
          onTap: () => {
            showDialog(
              context: context,
              builder: (context) => ProfileDialog(
                profile: profile,
              ),
            )
          },
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is LoadedSettingsState) {
                ProfileCardColorInterpolationField field =
                    state.settings.card.profileCard.colorInterpolationField;
                num maxThreshold = state.settings.card.profileCard.maxThreshold;
                num val = _getFieldValue(field, profile);

                return Card(
                  color: Color.lerp(
                    state.settings.card.profileCard.minColor,
                    state.settings.card.profileCard.maxColor,
                    val.toDouble() / maxThreshold,
                  ),
                  child: Container(
                    margin: _margin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                profile.alias == null
                                    ? '<no alias>'
                                    : profile.alias!,
                                style: Theme.of(context).textTheme.subtitle1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: profile.getAvatarURL(),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          ],
                        ),
                        Expanded(
                          child: BlocBuilder<SettingsBloc, SettingsState>(
                            buildWhen: (p, c) => c is LoadedSettingsState,
                            builder: (context, state) {
                              if (state is LoadingSettingsState) {
                                return SizedBox();
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (settingsBloc
                                      .settings.card.profileCard.showJoined)
                                    Text(
                                      'Joined ${timeago.format(profile.dateJoined)}',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  if (settingsBloc.settings.card.profileCard
                                      .showSubscriberCount)
                                    Text(
                                      'Has ${profile.stats.subscriberCount} subscribers',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  if (settingsBloc.settings.card.profileCard
                                      .showFollowingCount)
                                    Text(
                                      'Following ${profile.stats.followingCount} people',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
