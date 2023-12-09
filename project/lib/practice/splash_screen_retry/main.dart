import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/tree.jpeg",
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
