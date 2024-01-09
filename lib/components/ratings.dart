import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Ratings extends StatelessWidget{

  final String ratings;

  const Ratings({super.key, required this.ratings});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            if (index < double.parse(ratings).toInt()) {
              return const Icon(Icons.star,
                  color: Colors.amber,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 0.1
                    )
                  ], size: 22,);
            } else {
              return Icon(Icons.star,
                  color: Colors.grey[300],
                  shadows: const [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 0.1,
                    )
                  ],  size: 20); // Change color for remaining stars
            }
          }),
        ),
      ],
    );
  }
}