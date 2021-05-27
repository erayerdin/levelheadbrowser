// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/repositories/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:nock/nock.dart';

void main() {
  group('rumpus', () {
    late ProfileRepository<PlayersParams, Profile> _repository;

    setUpAll(() async {
      setUpDI();
      await getIt.allReady(); // wait for container to be ready

      // remove cache interceptor, we're gonna mock it
      Dio client = getIt.get(instanceName: 'http.client.rumpus');
      client.interceptors
          .removeWhere((element) => element is DioCacheInterceptor);

      nock.defaultBase = 'https://www.bscotch.net/api/levelhead';
      nock.init();
      _repository = getIt.get(instanceName: 'data.repositories.profile.rumpus');
    });

    setUp(() {
      nock.cleanAll();
    });

    test('list', () async {
      var mockResponseBody =
          '{"data":[{"_id":"60a75140df13770172f5a888","userId":"6d2dmj","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":0,"TimeTrophies":0},"createdAt":"2021-05-21T06:20:48.069Z","updatedAt":"2021-05-21T06:20:49.170Z","alias":{"userId":"6d2dmj","alias":"RubberCircus","avatarId":"gr18-serious","context":"levelhead"}},{"_id":"60a74eb3aa5335017d893c18","userId":"tzgm0c","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":2,"TimeTrophies":0},"createdAt":"2021-05-21T06:09:55.883Z","updatedAt":"2021-05-21T06:40:56.744Z","alias":{"userId":"tzgm0c","alias":"Maygamer112","avatarId":"gr18-sprint","context":"levelhead"}},{"_id":"60a74e7edf13770172f5a81b","userId":"tx0wv4","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":0,"TimeTrophies":0,"Fails":5,"LevelsPlayed":5,"Wins":5},"createdAt":"2021-05-21T06:09:02.232Z","updatedAt":"2021-05-21T06:29:19.120Z","alias":{"userId":"tx0wv4","alias":"Reimmop","avatarId":"package","context":"levelhead"}},{"_id":"60a749c3aa5335017d8939ad","userId":"3zbrbg","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":0,"TimeTrophies":0,"Fails":6,"LevelsPlayed":2,"Wins":1},"createdAt":"2021-05-21T05:48:51.887Z","updatedAt":"2021-05-21T06:14:38.490Z","alias":{"userId":"3zbrbg","alias":"ElzoweeRampponga","avatarId":"budde-happy","context":"levelhead"}},{"_id":"60a7487daa5335017d893955","userId":"bh3wl3","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":0,"TimeTrophies":0},"createdAt":"2021-05-21T05:43:25.720Z","updatedAt":"2021-05-21T05:43:27.728Z","alias":{"userId":"bh3wl3","alias":"JoJo","avatarId":"flapjack","context":"levelhead"}},{"_id":"60a744dadf13770172f5a656","userId":"9fswnz","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":0,"TimeTrophies":0},"createdAt":"2021-05-21T05:27:54.502Z","updatedAt":"2021-05-21T05:27:58.102Z","alias":{"userId":"9fswnz","alias":"bilibilizzzz","avatarId":"input-switch","context":"levelhead"}},{"_id":"60a74250df13770172f5a5dc","userId":"sphkkt","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":1,"TimeTrophies":0,"Fails":2,"LevelsPlayed":1,"Wins":2},"createdAt":"2021-05-21T05:17:04.193Z","updatedAt":"2021-05-21T05:38:44.088Z","alias":{"userId":"sphkkt","alias":"huebearsong","avatarId":"gr18-serious","context":"levelhead"}},{"_id":"60a741abaa5335017d8937b3","userId":"krpgtv","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":0,"TimeTrophies":0,"LevelsPlayed":4,"Wins":2,"Fails":9},"createdAt":"2021-05-21T05:14:19.066Z","updatedAt":"2021-05-21T05:25:22.104Z","alias":{"userId":"krpgtv","alias":"AKERman","avatarId":"two-players","context":"levelhead"}},{"_id":"60a73f99df13770172f5a53b","userId":"j1n6kb","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":1,"TimeTrophies":0,"LevelsPlayed":9,"Wins":9,"Fails":9},"createdAt":"2021-05-21T05:05:29.513Z","updatedAt":"2021-05-21T05:48:33.494Z","alias":{"userId":"j1n6kb","alias":"Qmegali","avatarId":"puncher-blue","context":"levelhead"}},{"_id":"60a73c6bdf13770172f5a4b0","userId":"m8gpcw","stats":{"Subscribers":0,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":0,"TippedPerDay":0,"HiddenGem":0,"Trophies":0,"PerkPoints":5,"CampaignProg":2,"TimeTrophies":0},"createdAt":"2021-05-21T04:51:55.900Z","updatedAt":"2021-05-21T05:17:27.439Z","alias":{"userId":"m8gpcw","alias":"IpmumbleDangpompq","avatarId":"gr18-zipper_flip","context":"levelhead"}}]}';
      nock.get(startsWith('/players'))
        ..reply(
          200,
          mockResponseBody,
          headers: {'Content-Type': 'application/json'},
        );

      List<Profile> profiles = await _repository.list(PlayersParams());
      Profile profile1 = profiles[0];
      Profile profile2 = profiles[1];

      expect(profile1.id, '6d2dmj');
      expect(profile2.id, 'tzgm0c');
    });
  });
}
