import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.purple,
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.black,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
