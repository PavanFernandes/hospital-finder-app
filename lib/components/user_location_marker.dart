import 'package:avatar_glow/avatar_glow.dart';
import 'package:demo_first_app/components/avatar.dart';
import 'package:demo_first_app/utils/appColor.dart';
import 'package:flutter/material.dart';

class UserLocationMarker extends StatelessWidget{

  const UserLocationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowColor: Colors.grey,
      glowRadiusFactor: 2,
      child: const Avatar(image: "assets/images/rimmuru.jpg"),
      );
  }

}