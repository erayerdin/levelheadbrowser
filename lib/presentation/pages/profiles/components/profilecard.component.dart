// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/profiles/components/profiledialog/profiledialog.component.dart';
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
                child: Card(
                  color: Color.lerp(
                      state.settings.appearance.profileCardMinColor,
                      state.settings.appearance.profileCardMaxColor,
                      profile.stats.subscriberCount == null
                          ? 0
                          : profile.stats.subscriberCount! / _MAX_SUBS_LIMIT),
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
                              if (profile
                                  .getAvatarURL()
                                  .contains('avatars/null'))
                                Icon(Icons.error)
                              else
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
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
