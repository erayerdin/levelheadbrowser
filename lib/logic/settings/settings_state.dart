part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class LoadingSettingsState implements SettingsState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class LoadedSettingsState implements SettingsState {
  final Settings settings;

  LoadedSettingsState({
    required this.settings,
  });

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
