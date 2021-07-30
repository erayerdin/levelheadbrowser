part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettingsEvent implements SettingsEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class SaveSettingsEvent implements SettingsEvent {
  final Settings settings;

  SaveSettingsEvent({
    required this.settings,
  });

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
