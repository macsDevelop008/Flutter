part of 'gps_bloc.dart';

abstract class GpsEvent {
  const GpsEvent();
}

class GpsOnEvent extends GpsEvent {
  final bool isGpsEnabled;

  GpsOnEvent({required this.isGpsEnabled});
}

class GpsPermissionEvent extends GpsEvent {
  final bool isGpsPermissionGranted;

  GpsPermissionEvent({required this.isGpsPermissionGranted});
}
