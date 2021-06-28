// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class Tuple2RangeValuesConverter
    extends Converter<Tuple2<num, num>, RangeValues> {
  @override
  RangeValues convert(Tuple2<num, num> input) {
    return RangeValues(
      input.item1.floorToDouble(),
      input.item2.floorToDouble(),
    );
  }
}
