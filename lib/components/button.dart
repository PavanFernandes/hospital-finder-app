import 'package:flutter/material.dart';

import '../utils/appColor.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const Button({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return AppColors.box; // Return your desired color
          },
        )),
        child: Text(label,
            style: const TextStyle(color: Colors.black87)));
  }
}

// ElevatedButton(
//     onPressed: () async {
//       Filter(context: context, param: setFilteredHospitalData)
//           .showFilterOptions();
//     },
//     style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>(
//           (Set<MaterialState> states) {
//         return AppColors.box; // Return your desired color
//       },
//     )),
//     child: const Text('Filter',
//         style: TextStyle(color: AppColors.primaryDark))),
