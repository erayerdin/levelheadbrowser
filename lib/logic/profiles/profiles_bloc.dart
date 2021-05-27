import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:levelheadbrowser/data/models/params/players.dart';
import 'package:levelheadbrowser/data/models/profile.dart';
import 'package:levelheadbrowser/data/repositories/profile.dart';
import 'package:levelheadbrowser/di.dart';
import 'package:logger/logger.dart';

part 'profiles_event.dart';
part 'profiles_state.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  final Logger _logger = getIt.get();
  final ProfileRepository<PlayersParams, Profile> _repository =
      getIt.get(instanceName: 'data.repositories.profile.rumpus');

  ProfilesBloc() : super(LoadingProfilesState());

  @override
  Stream<ProfilesState> mapEventToState(
    ProfilesEvent event,
  ) async* {
    if (event is LoadProfilesEvent) {
      _logger.d('ProfilesBloc event is LoadProfilesEvent.');

      _logger.d('ProfilesBloc state is LoadingProfilesState.');
      yield LoadingProfilesState();

      try {
        List<Profile> profiles = await _repository.list(event.params);
        _logger.d('ProfilesBloc state is LoadedProfilesState.');
        yield LoadedProfilesState(profiles: profiles);
      } on DioError catch (e, stacktrace) {
        _logger.d('ProfilesBloc state is FailedProfileState.');
        _logger.e(e);
        _logger.e(stacktrace);
        yield FailedProfilesState(
            message: 'An error occured while connecting to Rumpus service.');
      } catch (e, stacktrace) {
        _logger.d('ProfilesBloc state is FailedProfileState.');
        _logger.e(e);
        _logger.e(stacktrace);
        yield FailedProfilesState(message: 'An unknown error occured.');
      }
    }
  }
}
