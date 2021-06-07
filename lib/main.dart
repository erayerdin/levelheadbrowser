import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/observer.dart';
import 'package:levelheadbrowser/presentation/pages/home/home.page.dart';

void main() async {
  setUpDI();
  Bloc.observer = LoggingObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LevelHead Browser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/': (routeCtx) => HomePage()},
      initialRoute: '/',
    );
  }
}
