
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HospitalDetail extends StatelessWidget {

  const HospitalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Access the values
    final String hospitalName = arguments['hospitalName'];
    final String hospitalAddress = arguments['hospitalAddress'];

    // Now you can use hospitalName and hospitalAddress in your widget tree
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Name: $hospitalName'),
            const SizedBox(
              height: 10,
            ),
            Text('Address: $hospitalAddress'),
          ],
        ),
      ),
    );
  }
}