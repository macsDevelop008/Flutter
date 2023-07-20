part of 'location_bloc.dart';

@immutable
abstract class LocationState {
  final bool followingUser;

  const LocationState({this.followingUser = false});
}

class LocationInitial extends LocationState {}
