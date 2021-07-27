// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkCubit extends Cubit<Uri?> {
  late StreamSubscription _deepLinkSub;

  DeepLinkCubit() : super(null) {
    _deepLinkSub = uriLinkStream.listen((uri) {
      emit(uri);
    });
  }

  @override
  Future<void> close() {
    _deepLinkSub.cancel();
    return super.close();
  }
}
