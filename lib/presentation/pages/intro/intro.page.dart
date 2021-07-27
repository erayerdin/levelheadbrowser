// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

// ignore: non_constant_identifier_names
final _PAGES = [
  PageViewModel(
    title: 'Welcome, employee!',
    body: 'Levelhead Browser helps you explore Levelhead universe.',
    image: Image.asset('assets/images/intro/sarcasm.png'),
  ),
  PageViewModel(
    title: 'Find a colleague!',
    body: 'You can search for profiles, filter and sort them.',
    image: Image.asset('assets/images/intro/profiles.png'),
  ),
  PageViewModel(
    title: 'Carry the package to many galaxies!',
    body:
        'You can also explore new levels, filter and sort them, see the types '
        'of the levels and view the records.',
    image: Image.asset('assets/images/intro/levels.png'),
  ),
  PageViewModel(
    title: 'Catch the daily challenge!',
    body: 'In a competitive mood? Check out tower trial and see the current '
        'time records and highest records.',
    image: Image.asset('assets/images/intro/towertrial.png'),
  ),
  PageViewModel(
    title: 'No affiliations',
    body: 'I\'m not associated with Butterscotch '
        'Shenanigans. I\'m not working for them. This is not an official app '
        'from them.',
    image: Image.asset('assets/images/intro/noaffiliation.png'),
  ),
  PageViewModel(
    title: 'Open Source',
    body: 'This project is open source and licensed under the terms of Mozilla '
        'Public License 2.0. You can check out the code and send reports if '
        'you have any issues with it or propose enhancement.',
    // TODO add no warranties in the future
    image: Image.asset('assets/images/intro/opensource.png'),
  ),
];

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: _PAGES,
      done: Text('Done'),
      onDone: () {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      showNextButton: true,
      next: Icon(Icons.arrow_right),
      showSkipButton: true,
      skip: Text('Skip'),
    );
  }
}
