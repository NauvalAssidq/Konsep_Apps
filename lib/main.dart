import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the HomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manhwa Gallery',
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme for the whole app
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, color: Colors.white),
          bodyMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, color: Colors.white),
          titleLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600, color: Colors.white), // For AppBar title
        ),
        scaffoldBackgroundColor: Colors.black, // Dark background for the whole app
      ),
      home: HomePage(), // Set HomePage as the home screen
    );
  }
}
