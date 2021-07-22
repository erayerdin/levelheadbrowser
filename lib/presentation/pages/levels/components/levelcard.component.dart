// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/data/models/level.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/homepage/homepage_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/levels/components/leveldialog/leveldialog.component.dart';

class LevelCardComponent extends StatelessWidget {
  final EdgeInsets _margin = getIt.get(instanceName: 'style.space.10');
  final Level level;

  LevelCardComponent({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: Theme.of(context).cardTheme.copyWith(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        textTheme: Theme.of(context).textTheme.copyWith(
              subtitle1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
              caption: TextStyle(
                color: Colors.white,
              ),
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Colors.white,
            ),
      ),
      child: Builder(
        builder: (context) => GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<HomePageBloc>(context),
              child: LevelDialog(level: level),
            ),
          ),
          child: Card(
            color: Color.lerp(
              Colors.red,
              Colors.green,
              level.stats.clearRate.toDouble(),
            ),
            child: Container(
              margin: _margin,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: level.getAvatarURL(),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: 170,
                            child: Text(
                              level.title,
                              style: Theme.of(context).textTheme.subtitle1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              // IconButton(
                              //   icon: Icon(Icons.favorite_border),
                              //   onPressed: () {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //         content: Text('Not Implement Yet'),
                              //       ),
                              //     );
                              //   }, // TODO implement like button
                              // ),
                              Container(
                                child: Icon(Icons.favorite),
                                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              ),
                              Text(
                                level.stats.likeCount == null
                                    ? '0'
                                    : level.stats.likeCount.toString(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // IconButton(
                              //   icon: Icon(Icons.star_outline_outlined),
                              //   onPressed: () {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //         content: Text('Not Implement Yet'),
                              //       ),
                              //     );
                              //   }, // TODO implement favorite button
                              // ),
                              Container(
                                child: Icon(Icons.star),
                                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              ),
                              Text(
                                level.stats.favoriteCount == null
                                    ? '0'
                                    : level.stats.favoriteCount.toString(),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
