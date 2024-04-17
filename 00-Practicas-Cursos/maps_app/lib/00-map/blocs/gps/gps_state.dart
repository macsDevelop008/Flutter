part of 'gps_bloc.dart';

abstract class GpsState {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  //Retorna si ya se validaron el gps y el permiso de este
  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;

  const GpsState(
      {this.isGpsEnabled = false, this.isGpsPermissionGranted = false});
}

class GpsInitial extends GpsState {
  GpsInitial() : super(isGpsEnabled: false, isGpsPermissionGranted: false);
}

class GpsOn extends GpsState {
  final bool newIsGpsEnabled;
  final bool currentIsGpsPermissionGranted;
  const GpsOn(this.newIsGpsEnabled, this.currentIsGpsPermissionGranted)
      : super(
            isGpsEnabled: newIsGpsEnabled,
            isGpsPermissionGranted: currentIsGpsPermissionGranted);
}

class GpsPermission extends GpsState {
  final bool currentIsGpsEnabled;
  final bool newIsGpsPermissionGranted;

  GpsPermission(this.currentIsGpsEnabled, this.newIsGpsPermissionGranted)
      : super(
            isGpsEnabled: currentIsGpsEnabled,
            isGpsPermissionGranted: newIsGpsPermissionGranted);
}
