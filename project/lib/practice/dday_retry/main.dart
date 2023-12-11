import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/practice/dday_retry/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.indigo,
            fontFamily: 'parisienne',
          ),
          displayMedium: TextStyle(
            color: Colors.tealAccent,
            fontSize: 50,
            fontFamily: 'nanumbrushscript',
          ),
        ),
      ),
      home: DDayScreen(),
    ),
  );
}
