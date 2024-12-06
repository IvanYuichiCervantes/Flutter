// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/profile_page.dart';
import 'screens/data_page.dart';

void main() => runApp(StudentProfilesManager());

class StudentProfilesManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profiles Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),         // Home Page Route
        '/profile': (context) => ProfilePage(), // Profile Page Route
        '/data': (context) => DataPage(),     // Data Management Route
      },
    );
  }
}
