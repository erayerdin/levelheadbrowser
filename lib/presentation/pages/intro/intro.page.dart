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
    body:
        'I don\'t even know what the purpose for the image above is but bear with me. '
        'This app helps you browse Levelhead world.',
    image: Image.asset('assets/images/intro/sarcasm.png'),
  ),
  PageViewModel(
    title: 'Find your true love!',
    body: 'What\'s with these images and titles, what? Ahem. Whatever. Well, '
        'I suppose it means you can search for other players. As for love, '
        'I think there are specific apps for that but this isn\'t the one.',
    image: Image.asset('assets/images/intro/profiles.png'),
  ),
  PageViewModel(
    title: 'Carry the package to many galaxies!',
    body:
        'And... this image stands for ... *random page-turn noises* ... well, '
        'I guess you will be the new intergalactic package carrier guy. If you '
        'don\'t want to be get deployed to a gas giant, neutron star or, the '
        'worst, a black hole with your minimum wage salary, though, you can check '
        'levels section.',
    image: Image.asset('assets/images/intro/levels.png'),
  ),
  PageViewModel(
    title: 'Catch the daily challenge!',
    body: 'If you love to carry packages around, for some reason, you can also '
        'check out daily builds. In return, your name will be written to the '
        'employee of the day board. And your wage still stays minimum. Guaranteed!',
    image: Image.asset('assets/images/intro/dailybuild.png'),
  ),
  PageViewModel(
    title: 'No affiliations',
    body: 'Okay, this is a bit serious. I\'m not associated with Butterscotch '
        'Shenanigans. I\'m not working for them. This is not an official app '
        'from them. Well, out of my chest.',
    image: Image.asset('assets/images/intro/noaffiliation.png'),
  ),
  PageViewModel(
    title: 'Open Source',
    body: 'This project is open source and licensed under the terms of Apache '
        'License 2.0. You can look at the code, send enhancement proposals, whatever. ',
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
