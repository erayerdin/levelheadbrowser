// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/data/models/params/levels.dart';
import 'package:levelheadbrowser/data/repositories/level.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:nock/nock.dart';

void main() {
  group('rumpus', () {
    late LevelRepository<LevelsParams, Level> _repository;

    setUpAll(() async {
      setUpDI();
      await getIt.allReady(); // wait for container to be ready

      // remove cache interceptor, we're gonna mock it
      Dio client = getIt.get(instanceName: 'http.client.rumpus');
      client.interceptors.removeWhere(
        (element) => element is DioCacheInterceptor,
      );

      nock.defaultBase = 'https://www.bscotch.net/api/levelhead';
      nock.init();
      _repository = getIt.get(instanceName: 'data.repositories.level.rumpus');
    });

    setUp(() {
      nock.cleanAll();
    });

    test('list', () async {
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': 'vfhy42'})
        ..reply(
          200,
          '{"data":[{"_id":"5cd2e7332cf4e2002c3cda53","userId":"vfhy42","stats":{"Subscribers":86,"Crowns":2,"Shoes":5,"PlayTime":350826,"Trophies":7,"Fails":6428,"LevelsPlayed":264,"NumFollowing":53,"Wins":206,"CampaignProg":81,"TimeTrophies":2,"Published":11,"BucksTipped":29329,"Plays":21014,"TipsGotten":108376,"FaveGen":99,"LikeGen":141,"ChalWins":2,"HiddenGem":254,"Graduated":9,"PerkPoints":470,"ReplayValueAverage":null,"TipsPerLevel":9852.363636363636,"TipsPerDay":143.3951442657668,"TippedPerLevelPlayed":111.09469696969697,"TippedPerDay":38.80597351969693},"createdAt":"2019-05-08T14:26:59.991Z","updatedAt":"2021-06-02T09:18:24.781Z","alias":{"userId":"vfhy42","alias":"CyberTvorog","avatarId":"blopfush-love","context":"levelhead","whitelisted":true}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': '6h97ml'})
        ..reply(
          200,
          '{"data":[{"_id":"5ce8de403c297600374724bc","userId":"6h97ml","stats":{"Subscribers":3014,"Crowns":141,"Shoes":61,"PlayTime":8843465,"Trophies":202,"Fails":47291,"LevelsPlayed":5937,"Wins":4991,"DBComp":64,"Published":164,"Plays":544259,"ChalWins":108,"CampaignProg":91,"NumFollowing":167,"TimeTrophies":95,"TipsGotten":1468388,"BucksTipped":63110,"FaveGen":2065,"LikeGen":5064,"PerkPoints":1155,"HiddenGem":14,"Graduated":145,"ReplayValueAverage":null,"TipsPerLevel":8953.585365853658,"TipsPerDay":1986.386320679055,"TippedPerLevelPlayed":10.629947785076638,"TippedPerDay":85.37310349720589},"createdAt":"2019-05-25T06:18:40.756Z","updatedAt":"2021-06-02T11:43:49.137Z","alias":{"userId":"6h97ml","alias":"Espurrator","avatarId":"shade-rune","context":"levelhead","whitelisted":true,"reports":47}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': '77t2n3'})
        ..reply(
          200,
          '{"data":[{"_id":"609545e1a9ceb7005ef56f3f","userId":"77t2n3","stats":{"Subscribers":6,"NumFollowing":0,"Crowns":0,"Shoes":0,"PlayTime":24883,"TipsPerLevel":15500,"TipsPerDay":597.8265453472688,"TippedPerLevelPlayed":244.1860465116279,"TippedPerDay":404.97927265460146,"HiddenGem":0,"Trophies":0,"PerkPoints":75,"CampaignProg":35,"TimeTrophies":0,"Fails":902,"LevelsPlayed":43,"Wins":36,"BucksTipped":10500,"Published":1,"Plays":847,"LikeGen":25,"TipsGotten":15500,"FaveGen":7,"Graduated":1},"createdAt":"2021-05-07T13:51:29.318Z","updatedAt":"2021-06-02T12:06:43.964Z","alias":{"userId":"77t2n3","alias":"camping6464","avatarId":"hot-fire","context":"levelhead"}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': 'rpx6w4'})
        ..reply(
          200,
          '{"data":[{"_id":"60a07c396c34b400d830cc8c","userId":"rpx6w4","stats":{"Subscribers":0,"NumFollowing":2,"Crowns":2,"Shoes":2,"PlayTime":0,"TipsPerLevel":0,"TipsPerDay":0,"TippedPerLevelPlayed":4.237288135593221,"TippedPerDay":32.36926180102418,"HiddenGem":0,"Trophies":4,"PerkPoints":35,"CampaignProg":57,"TimeTrophies":0,"Fails":1143,"LevelsPlayed":118,"Wins":36,"Published":2,"BucksTipped":500},"createdAt":"2021-05-16T01:58:17.215Z","updatedAt":"2021-05-31T12:41:36.696Z","alias":{"userId":"rpx6w4","alias":"MrGoober","avatarId":"gr18-sprint","context":"levelhead"}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': 'nbv1sl'})
        ..reply(
          200,
          '{"data":[{"_id":"608ba998a2f4f00095af8982","userId":"nbv1sl","stats":{"Subscribers":3,"NumFollowing":6,"Crowns":13,"Shoes":21,"PlayTime":15915,"TipsPerLevel":1131,"TipsPerDay":72.26167017230675,"TippedPerLevelPlayed":28.785340314136125,"TippedPerDay":351.2773321019828,"HiddenGem":0,"Trophies":34,"PerkPoints":100,"CampaignProg":13,"TimeTrophies":0,"Fails":12445,"LevelsPlayed":382,"Wins":1252,"Published":2,"Plays":716,"ChalWins":1,"LikeGen":0,"BucksTipped":10996,"FaveGen":0,"TipsGotten":2262},"createdAt":"2021-04-30T06:54:16.656Z","updatedAt":"2021-05-31T14:10:27.413Z","alias":{"userId":"nbv1sl","alias":"BlueBadger9","avatarId":"puncher-blue","context":"levelhead"}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': 'tct3j0'})
        ..reply(
          200,
          '{"data":[{"_id":"5edebd9fabf1bd0018f0d335","userId":"tct3j0","stats":{"Subscribers":276,"NumFollowing":140,"Crowns":1586,"Shoes":1703,"PlayTime":771477,"TipsPerLevel":16663.5,"TipsPerDay":1023.2728034769842,"TippedPerLevelPlayed":198.61303744798892,"TippedPerDay":1998.5524357523948,"HiddenGem":168,"Trophies":3290,"PerkPoints":915,"CampaignProg":100,"TimeTrophies":45,"LevelsPlayed":3605,"Wins":12170,"Fails":118284,"ChalWins":45,"Published":22,"Plays":71253,"LikeGen":666,"TipsGotten":366597,"FaveGen":356,"Graduated":16,"BucksTipped":716000},"createdAt":"2020-06-08T22:37:19.263Z","updatedAt":"2021-06-02T04:50:42.928Z","alias":{"userId":"tct3j0","alias":"JeedUnit","avatarId":"rebound-awe","context":"levelhead","whitelisted":true,"reports":8}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': 'rmhgmq'})
        ..reply(
          200,
          '{"data":[{"_id":"5eeacb0f8aeefa004452799f","userId":"rmhgmq","stats":{"Subscribers":599,"NumFollowing":0,"Crowns":2714,"Shoes":2249,"PlayTime":2767985,"TipsPerLevel":6700.36,"TipsPerDay":2397.0846546118173,"TippedPerLevelPlayed":40.27703056768559,"TippedPerDay":1319.8912587820846,"HiddenGem":35,"Trophies":4963,"PerkPoints":1190,"CampaignProg":100,"TimeTrophies":178,"Fails":124905,"LevelsPlayed":11450,"Wins":20094,"Published":125,"Plays":246928,"LikeGen":1791,"ChalWins":178,"TipsGotten":837545,"FaveGen":803,"Graduated":124,"DBComp":45,"BucksTipped":461172},"createdAt":"2020-06-18T02:01:51.579Z","updatedAt":"2021-06-02T11:40:02.118Z","alias":{"userId":"rmhgmq","alias":"Prototype GR18","avatarId":"zipper-party","context":"levelhead","whitelisted":true,"reports":50}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': '8bjq18'})
        ..reply(
          200,
          '{"data":[{"_id":"5e75525bebf936002081d4fa","userId":"8bjq18","stats":{"Subscribers":3071,"NumFollowing":170,"Crowns":207,"Shoes":269,"PlayTime":11159679,"HiddenGem":26,"Trophies":476,"PerkPoints":990,"CampaignProg":69,"TimeTrophies":47,"LevelsPlayed":7118,"BucksTipped":2224652,"Fails":90305,"Wins":9714,"TipsPerLevel":20639.476439790575,"TipsPerDay":8989.10297546746,"TippedPerLevelPlayed":312.53891542568135,"TippedPerDay":5072.784303089093,"Published":191,"DBComp":35,"Plays":1285981,"LikeGen":9983,"TipsGotten":3942140,"FaveGen":5371,"Graduated":189,"ChalWins":47},"createdAt":"2020-03-20T23:31:39.756Z","updatedAt":"2021-06-02T12:38:40.739Z","alias":{"userId":"8bjq18","alias":"FlowArt","avatarId":"wallslide","context":"levelhead","whitelisted":true,"reports":118}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': 'zchv6z'})
        ..reply(
          200,
          '{"data":[{"_id":"5ceb0fde46a6fe0063068a90","userId":"zchv6z","stats":{"Subscribers":4089,"Crowns":488,"Shoes":293,"PlayTime":6968404,"Trophies":781,"LevelsPlayed":8684,"Fails":107097,"Wins":9527,"ChalWins":258,"Published":101,"Plays":523110,"DBComp":22,"CampaignProg":100,"NumFollowing":179,"TimeTrophies":252,"TipsGotten":908715,"BucksTipped":781377,"FaveGen":1536,"LikeGen":3265,"PerkPoints":1215,"HiddenGem":12,"Graduated":100,"ReplayValueAverage":null,"TipsPerLevel":8997.178217821782,"TipsPerDay":1232.0002199624062,"TippedPerLevelPlayed":89.97892676186089,"TippedPerDay":1059.3603449635639},"createdAt":"2019-05-26T22:14:54.626Z","updatedAt":"2021-06-02T12:29:08.183Z","alias":{"userId":"zchv6z","alias":"Sleepy","avatarId":"gr-pumped","context":"levelhead","whitelisted":true,"reports":51}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': '9xxqfd'})
        ..reply(
          200,
          '{"data":[{"_id":"5eaa4be72ab9760020864003","userId":"9xxqfd","stats":{"Subscribers":624,"NumFollowing":41,"Crowns":305,"Shoes":1140,"PlayTime":3410745,"HiddenGem":36,"Trophies":1445,"PerkPoints":1165,"CampaignProg":100,"TimeTrophies":135,"Published":140,"LevelsPlayed":2949,"Wins":14589,"Fails":53681,"DBComp":69,"Plays":266744,"TipsGotten":1060402,"LikeGen":2261,"FaveGen":853,"BucksTipped":101549,"ChalWins":135,"Graduated":126,"ReplayValueAverage":null,"TipsPerLevel":7574.3,"TipsPerDay":2661.8909046008316,"TippedPerLevelPlayed":34.435062733129875,"TippedPerDay":254.91498457312403},"createdAt":"2020-04-30T03:54:15.181Z","updatedAt":"2021-06-02T12:38:40.740Z","alias":{"userId":"9xxqfd","alias":"atooomi","avatarId":"maya-angry","context":"levelhead","whitelisted":true,"reports":48}}]}',
          headers: {'Content-Type': 'application/json'},
        );
      nock.get(startsWith('/players'))
        ..persist()
        ..query({'includeAliases': 'true', 'userIds': 'mp2pp9'})
        ..reply(
          200,
          '{"data":[{"_id":"608e242f5cb77500c1817e60","userId":"mp2pp9","stats":{"Subscribers":45,"NumFollowing":178,"Crowns":65,"Shoes":62,"PlayTime":244605,"TipsPerLevel":2516.782608695652,"TipsPerDay":1848.9795106786423,"TippedPerLevelPlayed":0.07050359712230216,"TippedPerDay":1.5651452168616502,"HiddenGem":166,"Trophies":127,"PerkPoints":695,"CampaignProg":100,"TimeTrophies":17,"Fails":24099,"LevelsPlayed":695,"Wins":2471,"ChalWins":17,"Published":23,"Plays":23261,"LikeGen":126,"TipsGotten":57886,"FaveGen":46,"Graduated":9,"BucksTipped":49,"DBComp":1},"createdAt":"2021-05-02T04:01:51.557Z","updatedAt":"2021-06-02T11:23:56.285Z","alias":{"userId":"mp2pp9","alias":"LexLimbo","avatarId":"copter-concentrate","context":"levelhead","reports":1}}]}',
          headers: {'Content-Type': 'application/json'},
        );

      var levelsMockResponseBody = '''
      {"data":[{"_id":"60ad6503b1bbca01ebf2f983","cv":1020004,"userId":"vfhy42","levelId":"0hds26q","avatarId":"spookstone-screamer","title":"Through The Dungeon, GR-18","localeId":0,"locale":"en-US","tower":true,"towerTrial":false,"dailyBuild":false,"requiredPlayers":1,"creatorTime":1131.4,"tags":["ltag_boss","ltag_shop","ltag_explore"],"createdAt":"2021-05-25T20:58:43.568Z","updatedAt":"2021-05-28T12:26:56.812Z","createdAgo":228924,"content":{"World":49,"Movement":25,"Puzzles":100,"Enemies":36,"Hazards":11},"gameVersion":"1.20.4","stats":{"Attempts":1198,"Diamonds":4,"FailureRate":0.031573333333333335,"Favorites":9,"HiddenGem":147,"Likes":16,"PlayTime":37500,"Players":102,"ReplayValue":294,"Successes":14,"TimePerWin":2678.5714285714284,"ClearRate":0.011686143572621035,"ExposureBucks":47898},"records":{"HighScore":[{"userId":"77t2n3","value":234200,"createdAt":"2021-05-28T02:47:44.126Z"},{"userId":"rpx6w4","value":234200,"createdAt":"2021-05-27T23:28:19.543Z"},{"userId":"vfhy42","value":234200,"createdAt":"2021-05-25T20:58:43.567Z"}],"FastestTime":[{"userId":"nbv1sl","value":161.64,"createdAt":"2021-05-27T07:07:33.504Z"},{"userId":"tct3j0","value":175.72,"createdAt":"2021-05-27T00:58:42.539Z"},{"userId":"rpx6w4","value":653.72,"createdAt":"2021-05-27T21:36:22.132Z"}]},"tagNames":["Boss","Shop","Explore"]},{"_id":"60982abe2ce634002357e4c1","cv":1020004,"userId":"6h97ml","levelId":"t69bxcf","avatarId":"wallslide","title":"It's A Sneaky Mission!","localeId":0,"locale":"en-US","tower":true,"towerTrial":false,"dailyBuild":false,"requiredPlayers":1,"creatorTime":90.78,"tags":["ltag_bombs","ltag_eye","ltag_chase"],"createdAt":"2021-05-09T18:32:30.015Z","updatedAt":"2021-05-28T12:19:25.085Z","createdAgo":1620098,"content":{"World":100,"Movement":0,"Puzzles":55,"Enemies":3,"Hazards":76},"gameVersion":"1.20.4","stats":{"Attempts":1521,"Diamonds":3,"FailureRate":0.07359616463507931,"Favorites":10,"HiddenGem":138,"Likes":39,"PlayTime":19607,"Players":108,"ReplayValue":273,"Successes":78,"TimePerWin":251.37179487179486,"ClearRate":0.05128205128205128,"ExposureBucks":30557},"records":{"HighScore":[{"userId":"rmhgmq","value":89868,"createdAt":"2021-05-23T17:02:39.468Z"},{"userId":"8bjq18","value":89461,"createdAt":"2021-05-10T18:47:03.497Z"},{"userId":"zchv6z","value":88011,"createdAt":"2021-05-09T20:44:23.181Z"}],"FastestTime":[{"userId":"9xxqfd","value":50.56,"createdAt":"2021-05-10T08:11:08.358Z"},{"userId":"rmhgmq","value":56.53,"createdAt":"2021-05-23T17:03:53.148Z"},{"userId":"mp2pp9","value":70.69,"createdAt":"2021-05-23T07:51:17.849Z"}]},"tagNames":["Bombs","Tiptow","Chase"]}]}
      '''
          .trim();

      nock.get(startsWith('/levels'))
        ..persist()
        ..reply(
          200,
          levelsMockResponseBody,
          headers: {'Content-Type': 'application/json'},
        );

      List<Level> levels = await _repository.list(LevelsParams());
      Level level1 = levels[0];
      Level level2 = levels[1];

      expect(level1.id, '0hds26q');
      expect(level2.id, 't69bxcf');
    });
  });
}
