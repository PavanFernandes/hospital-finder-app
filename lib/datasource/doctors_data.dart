import 'dart:convert';
import 'package:demo_first_app/utils/constants/AppData.dart';
import 'package:http/http.dart' as http;

Future<dynamic> fetchDoctorsData() async {
  final response = await http.get(
    Uri.parse('${AppData.baseUrl}/doctor/fetch'),
  );
  if (response.statusCode == 200) {
    print("Fetching doctorsData");
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}