import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constants/AppData.dart';

Future<dynamic> fetchData() async {
  final response = await http.get(
    Uri.parse('${AppData.baseUrl}/hospital/fetch'),
  );
  if (response.statusCode == 200) {
    print("Fetching hospitalData");
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
