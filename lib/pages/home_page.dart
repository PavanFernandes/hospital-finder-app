import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> hospitalData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.249:8080/hospital/fetch'),
    );

    if (response.statusCode == 200) {
      print("Fetching hospitalData");
      setState(() {
        hospitalData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Finder',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: hospitalData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/hospital',
                      arguments: {
                        'hospitalName': hospitalData[index]['name'],
                        'hospitalAddress': hospitalData[index]['address'],
                      },
                    );
                  },
                  child: ListTile(
                    title: Text(hospitalData[index]['name']),
                    subtitle: Text(hospitalData[index]['address']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.verified_user_rounded), label: 'user'),
          ],
        )
    );
  }
}