part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class LoadingSettingsState extends SettingsState {}

class FailedLoadingSettingsState extends SettingsState {
  final String message;

  FailedLoadingSettingsState({
    required this.message,
  });
}

class LoadedSettingsState extends SettingsState {
  final Settings settings;

  LoadedSettingsState({
    required this.settings,
  });
}

class SavingSettingsState extends SettingsState {}

class FailedSavingSettingsState extends SettingsState {
  final String message;

  FailedSavingSettingsState({
    required this.message,
  });
}

class SavedSettingsState extends SettingsState {}
