import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(LoadingSettingsState());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
