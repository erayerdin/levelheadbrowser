// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

const Map<String, Tuple3<String, String, IconData?>> _BTG_ELMS = {
  'steam': Tuple3(
    'https://store.steampowered.com/app/792710/Levelhead/',
    'Steam',
    FontAwesomeIcons.steam,
  ),
  'epic': Tuple3(
    'https://www.epicgames.com/store/en-US/p/levelhead',
    'Epic Games Store',
    null,
  ),
  'gplay': Tuple3(
    'https://play.google.com/store/apps/details?id=com.bscotch.levelhead&hl=en&gl=US',
    'Google Play Store',
    FontAwesomeIcons.googlePlay,
  ),
};

class BuyTheGameDialog extends StatelessWidget {
  const BuyTheGameDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose a store'),
      content: Text('Choose a store to buy the game.'),
      actions: _BTG_ELMS.keys
          .map(
            (k) => ElevatedButton(
              onPressed: () => launch(_BTG_ELMS[k]!.item1),
              child: Row(
                children: [
                  if (_BTG_ELMS[k]!.item3 != null) ...[
                    Icon(_BTG_ELMS[k]!.item3),
                    SizedBox(
                      width: 10,
                    )
                  ],
                  Text(_BTG_ELMS[k]!.item2),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
