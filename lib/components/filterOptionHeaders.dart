import 'package:flutter/material.dart';

class FilterHeader extends StatelessWidget{

  final String title;
  final IconData icon;

   const FilterHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const SizedBox(width: 16,),
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 5,),
          Text(title, style: TextStyle(fontSize: 16, backgroundColor: Colors.blue.withAlpha(10)),),
        ],
      ),
    );
  }}