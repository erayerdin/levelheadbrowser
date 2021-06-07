part of 'profiles_bloc.dart';

abstract class ProfilesEvent extends Equatable {
  const ProfilesEvent();

  @override
  List<Object> get props => [];
}

class LoadProfilesEvent implements ProfilesEvent {
  final PlayersParams params;

  LoadProfilesEvent({
    required this.params,
  });

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  String toString() => 'LoadProfilesEvent(params: $params)';
}
