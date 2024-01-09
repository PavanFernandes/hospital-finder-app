import 'package:demo_first_app/pages/health_needs.dart';
import 'package:demo_first_app/utils/appColor.dart';
import 'package:demo_first_app/utils/constants/AppText.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final pages = [
    const MyHomePage(),
    const HealthNeeds(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: AppText.bottomNavigationLabel1),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.heart,), label: AppText.bottomNavigationLabel2,),
          ],
          selectedItemColor: AppColors.primary,
          currentIndex: currentPage,
          onTap: (index){
            setState(() {
              currentPage = index;
            });
          },
        )
    );
  }
}