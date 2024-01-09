import 'dart:ffi';
import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

int calculateDistance(Position userLocation, double hospitalLatitude, double hospitalLongitude) {
  const double earthRadius = 6371.0; // in kilometers

  double dLat = _toRadians(hospitalLatitude - userLocation.latitude);
  double dLon = _toRadians(hospitalLongitude - userLocation.longitude);

  double a = pow(sin(dLat / 2), 2) +
      pow(sin(dLon / 2), 2) *
          cos(_toRadians(userLocation.latitude)) *
          cos(_toRadians(hospitalLatitude));

  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return (earthRadius * c).round(); // distance in kilometers
}

double _toRadians(double degree) {
  return degree * (pi / 180);
}