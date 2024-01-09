import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget{

  final dynamic doctorData;

  const DoctorCard({super.key, required this.doctorData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image(image: AssetImage("assets/images/${doctorData["image"]}.png"))),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorData["name"], style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                const SizedBox(height: 4,),
                Text('${doctorData["hospital"]} hospital'),
                const SizedBox(height: 2,),
                Row(
                  children: [
                    Text(doctorData["speciality"], style: TextStyle(backgroundColor: Colors.teal.withAlpha(60)),),
                    const SizedBox(width: 8,),
                    Text("${doctorData["experience"]}+ years")
                  ],
                ),
                const SizedBox(height: 2,),
                Row(
                  children: [const Icon(Icons.star, color: Colors.yellow, size: 17,),
                    Text("4.9  "
                        "`${doctorData['reviews']} reviews")],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}