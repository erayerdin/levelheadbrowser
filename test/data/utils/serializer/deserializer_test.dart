// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_test/flutter_test.dart';
import 'package:levelheadbrowser/data/utils/serializer/deserailizer.dart';
import 'package:levelheadbrowser/di.dart';

class User {
  final String name;
  final String surname;

  User({
    required this.name,
    required this.surname,
  });
}

final userData = {
  'name': 'John',
  'surname': 'Doe',
};

class UserDeserializer implements Deserializer<User, Map<String, String>> {
  @override
  Future<User> deserialize(Map<String, String> data) async {
    return User(name: data['name']!, surname: data['surname']!);
  }
}

void main() {
  setUpAll(() async {
    setUpDI();
  });
  test('deserialize', () async {
    var user = await deserialize<User>(userData, UserDeserializer());
    expect(user.name, 'John');
    expect(user.surname, 'Doe');
  });
}
