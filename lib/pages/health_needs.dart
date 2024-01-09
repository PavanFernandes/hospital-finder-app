import 'package:demo_first_app/components/avatar.dart';
import 'package:demo_first_app/components/doctor_card.dart';
import 'package:demo_first_app/components/inkwell_cards.dart';
import 'package:demo_first_app/datasource/doctors_data.dart';
import 'package:demo_first_app/utils/appColor.dart';
import 'package:demo_first_app/utils/constants/AppText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HealthNeeds extends StatefulWidget {
  const HealthNeeds({super.key});

  @override
  State<HealthNeeds> createState() => _HealthNeedsState();
}

class _HealthNeedsState extends State<HealthNeeds> {
  List<dynamic> doctorsData = [];
  List<dynamic> filteredDoctorsData = [];
  TextEditingController searchController = TextEditingController();
  List<DoctorCard> doctorCards = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await fetchDoctorsData();
    if (data != null) {
      setState(() {
        doctorsData = filteredDoctorsData = data as List<dynamic>;
      });
    }
  }

  void filterSearchResults() {
    String query = searchController.text.trim();
    setState(() {
      if (query.isNotEmpty) {
        filteredDoctorsData = doctorsData
            .where((element) =>
                element['treatment']
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                element['speciality']
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      } else {
        filteredDoctorsData = doctorsData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.healthNeeds,
      body: LiquidPullToRefresh(
        onRefresh: () async {
          initState();
          await Future.delayed(const Duration(seconds: 1));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const SizedBox(
                      width: 50,
                      height: 50,
                      child:
                      Avatar(image: "assets/images/a1.png"),
                     //Image(image: AssetImage("assets/images/a1.png"))
      ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppText.greetings,
                    style: GoogleFonts.caveat(
                        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 2),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppText.searchPlaceholder,
                            hintStyle: GoogleFonts.caveat(textStyle: const TextStyle(fontSize: 16, letterSpacing: 1.3))
                          ),
                        ),
                      ),
                      // SizedBox(width: 35,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                              onTap: () {
                                filterSearchResults();
                              },
                              child: const Icon(Icons.send_sharp, color: Colors.black38,)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkwellCards(
                    icon: Icons.add,
                    title: "Clinic Visit",
                    subTitle: "make an appointment", color: AppColors.inkwellBox1,),
                InkwellCards(
                    icon: Icons.home,
                    title: "Home Visit",
                    subTitle: "call the doctor home", color: AppColors.inkwellBox2,)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 28.0, bottom: 3),
              child: Text(
                "Doctors",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                   // width: 380,
                    decoration: const BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        itemCount: filteredDoctorsData.length,
                        itemBuilder: (context, index) {
                          return DoctorCard(
                              doctorData: filteredDoctorsData[index]);
                        })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
