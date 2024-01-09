import 'package:demo_first_app/utils/appColor.dart';
import 'package:flutter/material.dart';

class InkwellCards extends StatelessWidget{

  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;

  const InkwellCards({super.key,required this.icon, required this.title, required this.subTitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 4,
            )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: Icon(icon,color: color, size: 30,
              ),
            ),
            const SizedBox(height: 22,),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),),
            const SizedBox(height: 2,),
            Text(subTitle, style: const TextStyle(color: Colors.white, fontSize: 12),)
          ],
        ),
      ),
    );
  }

}