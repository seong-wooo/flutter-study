import 'package:flutter/material.dart';
import 'package:project/practice/dday/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'nanumbrushscript',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80,
            fontWeight: FontWeight.w500,
            fontFamily: 'parisienne'
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        )
      ),
      home: HomeScreen(),
    )
  );
}