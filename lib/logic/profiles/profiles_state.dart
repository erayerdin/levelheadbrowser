part of 'profiles_bloc.dart';

abstract class ProfilesState extends Equatable {
  const ProfilesState();

  @override
  List<Object> get props => [];
}

class LoadingProfilesState implements ProfilesState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class LoadedProfilesState implements ProfilesState {
  final List<Profile> profiles;

  LoadedProfilesState({
    required this.profiles,
  });

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  String toString() => 'LoadedProfilesState(profiles: $profiles)';
}

class FailedProfilesState implements ProfilesState {
  final String message;

  FailedProfilesState({
    required this.message,
  });

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  String toString() => 'FailedProfilesState(message: $message)';
}
