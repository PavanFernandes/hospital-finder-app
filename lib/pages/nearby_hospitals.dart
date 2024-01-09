import 'package:demo_first_app/components/hospital_marker.dart';
import 'package:demo_first_app/utils/constants/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../components/user_location_marker.dart';
import '../datasource/hospital_data.dart';
import '../datasource/user_gps_location.dart';

class NearbyHospitals extends StatefulWidget {
  const NearbyHospitals({super.key});

  @override
  _NearbyHospitalsState createState() => _NearbyHospitalsState();
}

class _NearbyHospitalsState extends State<NearbyHospitals> {
  List<dynamic> hospitalData = [];
  late Position userPosition;

  LatLng currentCenter = const LatLng(33, -87);
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    getLocation().then((value) {
      setState(() {
        userPosition = value;
      });
    });
    fetchData().then((data) {
      if (data != null) {
        setState(() {
          hospitalData = data as List<dynamic>;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(AppText.nearbyHospitals,
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.blue[900],
      ),
      body: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: currentCenter,
            //(37.7749, -122.4194), // Initial map coordinates (San Francisco)
            initialZoom: 7.0,
            // Initial zoom level
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.hospital-finder.flutter',
            ),
            MarkerLayer(
              markers: [
                for (var hospital in hospitalData)
                  Marker(
                    width: 150.0,
                    height: 100.0,
                    point: LatLng(double.parse(hospital['latitude']),
                        double.parse(hospital['longitude'])),
                    child: HospitalMarker(
                        icon: FontAwesomeIcons.hospital,
                        name: hospital['name']),
                  ),
                Marker(
                    width: 45.0,
                    height: 45.0,
                    point: currentCenter,
                    child: const UserLocationMarker())
              ],
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  currentCenter =
                      LatLng(userPosition.latitude, userPosition.longitude);
                  mapController.move(currentCenter, 11);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 50),
                child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 5, color: Colors.grey)
                        ]),
                    child: Icon(Icons.location_searching_outlined,
                        color: Colors.blue[800])),
              )),
        ),
      ]),
    );
  }
}
