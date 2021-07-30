part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class LoadingSettingsState extends SettingsState {}

class LoadedSettingsState extends SettingsState {
  final Settings settings;

  LoadedSettingsState({
    required this.settings,
  });
}

class FailedSettingsState extends SettingsState {
  final String message;

  FailedSettingsState({
    required this.message,
  });
}

class SavingSettingsState extends SettingsState {}

class SavedSettingsState extends SettingsState {}
