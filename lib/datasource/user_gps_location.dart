import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  try {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  } catch (e) {
    throw Exception("Failed to get user gps coordinates + $e");
  }
}
