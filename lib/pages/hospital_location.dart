import 'package:demo_first_app/components/hospital_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class HospitalLocation extends StatelessWidget {
  String hospitalName;
  String latitude;
  String longitude;

  HospitalLocation(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.hospitalName});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(double.parse(latitude), double.parse(longitude)),
        initialZoom: 13.0, // Initial zoom level
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.hospital-finder.flutter',
        ),
        MarkerLayer(
          markers: [
            Marker(
                width: 200.0,
                height: 100.0,
                point: LatLng(double.parse(latitude), double.parse(longitude)),
                child: HospitalMarker(icon: FontAwesomeIcons.hospital, name: hospitalName)),
          ],
        ),
      ],
    );
  }
}
