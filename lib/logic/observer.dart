// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

class LoggingObserver implements BlocObserver {
  final Logger _logger = getIt.get();

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.d('$bloc has changed.');
    _logger.v('change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    _logger.d('Closing $bloc...');
  }

  @override
  void onCreate(BlocBase bloc) {
    _logger.d('Creating $bloc...');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.d('$bloc failed.');
    _logger.v('error: $error');
    _logger.v('stacktrace: $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.d('$bloc received event.');
    _logger.v('event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.d('$bloc is on transition');
    _logger.v('transition: $transition');
  }
}
