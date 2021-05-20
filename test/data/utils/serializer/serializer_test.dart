// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_test/flutter_test.dart';
import 'package:levelheadbrowser/data/utils/serializer/serializer.dart';
import 'package:levelheadbrowser/di.dart';

class User {
  final String name;
  final String surname;

  User({
    required this.name,
    required this.surname,
  });
}

class UserSerializer implements Serializer<User, Map<String, String>> {
  @override
  Future<Map<String, String>> serialize(User instance) async {
    return {
      'name': instance.name,
      'surname': instance.surname,
    };
  }
}

void main() {
  setUpAll(() async {
    setUpDI();
  });
  test('serialize', () async {
    var data = await serialize<Map<String, String>>(
        User(
          name: 'John',
          surname: 'Doe',
        ),
        UserSerializer());
    expect(data['name'], 'John');
    expect(data['surname'], 'Doe');
  });
}
