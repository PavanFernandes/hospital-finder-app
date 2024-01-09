import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{

  final String image;

  const Avatar({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1), // Border width
      decoration: const BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(16), // Image radius
          child: Image(image: AssetImage(image), fit: BoxFit.cover,),
        ),
      ),
    );
  }

}