import 'package:demo_first_app/pages/health_needs.dart';
import 'package:demo_first_app/pages/hospital_detail.dart';
import 'package:demo_first_app/pages/nearby_hospitals.dart';
import 'package:demo_first_app/pages/main_page.dart';
import 'package:demo_first_app/utils/appColor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const MainPage(),
      routes: {
        '/hospital': (context) => HospitalDetail(),
        '/map': (context) =>  NearbyHospitals(),
        '/health' : (context) => HealthNeeds(),
      },
    );
  }
}



