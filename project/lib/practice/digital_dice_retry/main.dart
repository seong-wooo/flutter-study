import 'package:flutter/material.dart';
import 'package:project/practice/digital_dice_retry/screen/root_screen.dart';

import 'constant.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(
          thumbColor: primaryColor,
          activeTrackColor: primaryColor,
          inactiveTrackColor: primaryColor.withOpacity(0.5),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.deepPurpleAccent,
          backgroundColor: Colors.lightGreen,
        ),
      ),
      home: const RootScreen(),
    )
  );
}