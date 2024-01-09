import 'package:demo_first_app/components/avatar.dart';
import 'package:demo_first_app/datasource/hospital_data.dart';
import 'package:demo_first_app/utils/appColor.dart';
import 'package:demo_first_app/utils/calculate_distance.dart';
import 'package:demo_first_app/utils/constants/AppData.dart';
import 'package:demo_first_app/utils/constants/AppText.dart';
import 'package:demo_first_app/components/filters.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../components/button.dart';
import '../components/ratings.dart';
import '../datasource/user_gps_location.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> hospitalData = [];
  List<dynamic> filteredHospitalData = [];
  bool isFilterOn = false;
  String filter = "";
  late Position userPosition;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final position = await getLocation();
    if (position != null) {
      setState(() {
        userPosition = position;
      });
      final data = await fetchData();
      if (data != null) {
        setState(() {
          hospitalData = filteredHospitalData = data as List<dynamic>;
          for (int i = 0; i < hospitalData.length; i++) {
            hospitalData[i]['distance'] = calculateDistance(
              userPosition,
              double.parse(hospitalData[i]['latitude']),
              double.parse(hospitalData[i]['longitude']),
            );
          }
          filteredHospitalData = hospitalData;
        //  filteredHospitalData.sort((a, b) => a['distance'].compareTo(b['distance']));
        });
      }
    }
  }


  void setFilteredHospitalData(String key) {
    setState(() {
        List<String> q = key.split(",");
        filter = '${q[0]} : ${q[1]}';
        isFilterOn = filter.isNotEmpty;
        switch(AppData.mapFilterOptions[q[0]]){
          case 1 : filteredHospitalData = hospitalData
              .where((element) => element[q[0]].toString().split(".")[0] == q[1])
              .toList();
          break;
          case 2 : filteredHospitalData = hospitalData
              .where((element) => element[q[0]].toString().contains(q[1]))
              .toList();
          break;
          case 3 : if(q[1] == 'Any') {
            filteredHospitalData = hospitalData;
          } else{
            filteredHospitalData = hospitalData.where((element) => element[q[0]] < double.parse(q[1])).toList();
          }
          break;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppText.appName),
            Avatar(image: "assets/images/rimmuru.jpg",)
          ],
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,

      ),
      body: LiquidPullToRefresh(
        onRefresh: () async{
          initState();
          await Future.delayed(const Duration(seconds: 1));
        },
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            /** filter and view map buttons **/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Button(label: 'Filter', onPressed: () async {Filter(context: context, param: setFilteredHospitalData).showFilterOptions();}),
                Button(label: 'View map', onPressed: () {Navigator.pushNamed(context, '/map');}),
              ],
            ),
            const SizedBox(height: 10,),
            /** filter **/

            Visibility(
              visible: isFilterOn,
                child: TextButton(onPressed: (){
                  setState(() {
                    filter = "";
                    filteredHospitalData = hospitalData;
                    isFilterOn = false;
                  });
            },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.cancel_sharp, color: AppColors.silverGrey),
                    const SizedBox(width: 5),
                    Text(filter,
                        style: const TextStyle(color: AppColors.primaryDark, fontSize: 15)),
                  ],
                ))),

            /** Hospital data  list **/

            Expanded(
              child: ListView.builder(
                itemCount: filteredHospitalData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/hospital',
                          arguments: {
                            'name': filteredHospitalData[index]['name'],
                            'address': filteredHospitalData[index]['address'],
                            'phNo': filteredHospitalData[index]['phoneNumber'],
                            'beds': filteredHospitalData[index]['beds'],
                            'services': filteredHospitalData[index]['services'],
                            'websiteUrl': filteredHospitalData[index]['websiteUrl'],
                            'speciality': filteredHospitalData[index]['speciality'],
                            'ratings': filteredHospitalData[index]['ratings'].toString(),
                            'latitude': filteredHospitalData[index]['latitude'],
                            'longitude': filteredHospitalData[index]['longitude'],
                            'imageUrl': filteredHospitalData[index]['imageUrl']
                          },
                        );
                      },
                    child: Column(
                      children: [
                        const SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Container(
                           // height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.box,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(filteredHospitalData[index]['name'], style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500) ),
                                  const SizedBox(height: 2,),
                                  Text(filteredHospitalData[index]['address'], style: const TextStyle(color: Colors.black38),),
                                  const SizedBox(height: 1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Ratings(ratings: filteredHospitalData[index]['ratings'].toString()),
                                      Text('${filteredHospitalData[index]['distance'].toString()} km', style: const TextStyle(color: Colors.black38))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}