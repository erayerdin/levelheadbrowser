// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:levelheadbrowser/presentation/pages/home/home.page.dart';
import 'package:levelheadbrowser/presentation/pages/settings/pages/card/profile/profile.settings.page.dart';
import 'package:levelheadbrowser/presentation/pages/settings/settings.page.dart';

// ignore: non_constant_identifier_names
final ROUTES = {
  '/': (_) => HomePage(),
  '/settings': (_) => SettingsPage(),
  '/settings/card/profile': (_) => ProfileCardSettingsPage(),
};
