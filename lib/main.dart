import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:levelheadbrowser/logic/deeplink/deeplink_cubit.dart';
import 'package:levelheadbrowser/logic/firstrun/firstrun_cubit.dart';
import 'package:levelheadbrowser/logic/observer.dart';
import 'package:levelheadbrowser/logic/settings/settings_bloc.dart';
import 'package:levelheadbrowser/presentation/pages/home/home.page.dart';
import 'package:levelheadbrowser/presentation/pages/intro/intro.page.dart';
import 'package:levelheadbrowser/presentation/pages/settings/settings.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDI();
  await getIt.allReady();
  Bloc.observer = LoggingObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirstRunCubit>(
          create: (_) => FirstRunCubit()..checkIfFirstRun(),
        ),
        BlocProvider<DeepLinkCubit>(
          create: (_) => DeepLinkCubit(),
        ),
        BlocProvider<SettingsBloc>(
          create: (_) => SettingsBloc()..add(LoadSettingsEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Levelhead Browser',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (_) => HomePage(),
          '/intro': (_) => IntroPage(),
          '/settings': (_) => SettingsPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
