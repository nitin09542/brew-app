import 'package:flutter/material.dart';

class CustomColors {
  static const Color primaryColor = Color(0xFF3366FF);
  static const Color secondaryColor = Color(0xFF66CC33);
  static const Color accentColor = Color(0xFFFF9933);
  static const Color splashColor =  Color(0xFF46DE99);
  static const Color statusbar =  Color(0xFFF6FFF6) ;
// Add more custom colors as needed
}
final ThemeData myCustomTheme = ThemeData(
  primaryColor: Colors.blue, // Change the primary color
  secondaryHeaderColor: Colors.green, // Change the accent color
  fontFamily: 'Roboto', // Use a custom font family
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 16.0), // Customize text styles
    headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
  ),
  // Add more theme settings as needed
);