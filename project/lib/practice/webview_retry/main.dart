import 'package:flutter/material.dart';
import 'package:project/practice/webview_retry/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    ),
  );
}
