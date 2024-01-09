import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/appColor.dart';

class HospitalMarker extends StatelessWidget{

  final IconData icon;
  final String name;

  const HospitalMarker({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: AvatarGlow(
            glowColor: Colors.grey,
            glowRadiusFactor: 1,
            child: SizedBox(
              child: FaIcon(icon,
                  color: AppColors.red,
                  size: 35,
                  shadows: const [
                    Shadow(
                      color: Colors.black38,
                      blurRadius: 1,
                    )
                  ]),
            ),
          ),
        ),
        Expanded(
            child: Text(
              name,
              style: const TextStyle(
                  color: AppColors.red, fontWeight: FontWeight.bold, fontSize: 18),
            )),
      ],
    );
  }
}