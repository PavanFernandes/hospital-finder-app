import 'package:demo_first_app/components/avatar.dart';
import 'package:demo_first_app/pages/hospital_location.dart';
import 'package:demo_first_app/utils/appColor.dart';
import 'package:demo_first_app/utils/constants/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetail extends StatelessWidget {
  const HospitalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Access the values
    final String name = arguments['name'];
    final String address = arguments['address'];
    final String phNo = arguments['phNo'];
    final String beds = arguments['beds'];
    final String websiteUrl= arguments["websiteUrl"];
    final String services = arguments['services'];
    final String speciality = arguments['speciality'];
    final String ratings = arguments['ratings'];
    final String latitude = arguments['latitude'];
    final String longitude = arguments['longitude'];
    final String imageUrl = arguments['imageUrl'];
    const double size = 10;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(AppText.hospitalDetails,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(),
        ),
        backgroundColor: AppColors.primary ,
        elevation: 2,
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
           // const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 12),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /** hospital Image **/
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.network( imageUrl,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: () {
                            },
                              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                              // foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                                child: const Text("Appointment"),),
                            ElevatedButton(onPressed: (){},
                               // style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.red)),
                                child: const Text("call"))
                          ],
                        ),
                      )
                    ]

                  ),
                ),
                const SizedBox(height: 10),

                /**  Hospital information **/

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8, top: 5, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(height: size),

                    Text(
                      "Address : $address.",
                      style:
                      const TextStyle(fontSize: 18, color: AppColors.hospitalDetails, height: 1.2),
                    ),
                    const SizedBox(height: size),

                   const Text("Open 24 hours", style:
                   TextStyle(fontSize: 18, color: AppColors.hospitalDetails, height: 1.2)),
                    const SizedBox(height: size),

                    Row(
                      children: [
                        const Text("Phone number : ",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.hospitalDetails, height: 1.2)),
                        Text(phNo,
                            style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.hospitalDetails))
                      ],
                    ),
                    const SizedBox(height: size),

                    Row(children: [
                      Text("Ratings :  $ratings ",
                          style: const TextStyle(
                              fontSize: 18, color: AppColors.hospitalDetails)),
                      RatingBar(
                        minRating: 1,
                        maxRating: 5,
                        itemSize: 20,
                        ignoreGestures: true,
                        itemPadding: const EdgeInsets.only(bottom: 2),
                        initialRating: double.parse(ratings),
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.amber,),
                          empty: Icon(Icons.star, color: Colors.grey[300],),
                          half: const Icon(Icons.star_half, color: Colors.amber,)
                        ),
                        onRatingUpdate: (double value) {  }, ),
                    ]),
                    const SizedBox(height: size),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const Text("website : ",
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.hospitalDetails)),
                          GestureDetector(
                              onTap: () async{
                                print("http://www.$websiteUrl");
                                 await launchUrl(Uri.parse("http://www.$websiteUrl"));
                              },
                            child: Text(websiteUrl,
                                style: const TextStyle(
                                    fontSize: 15, color: AppColors.hospitalDetails, decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: size),

                    Text("beds : $beds.",
                        style: const TextStyle(
                            fontSize: 18, color: AppColors.hospitalDetails, height: 1.2)),
                    const SizedBox(height: size),

                    Text("Services : $services.",
                        style: const TextStyle(
                            fontSize: 18, color: AppColors.hospitalDetails, height: 1.2)),
                    const SizedBox(height: size),

                    Text("Speciality : $speciality.",
                        style: const TextStyle(
                            fontSize: 18, color: AppColors.hospitalDetails, height: 1.2)),
                    const SizedBox(height: size),

                  ],
                ),
                ),

                const SizedBox(
                  height: 20,
                ),

                /** Map location **/

                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 25, left: 25, right: 25),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: HospitalLocation(
                        latitude: latitude,
                        longitude: longitude,
                        hospitalName: name),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}