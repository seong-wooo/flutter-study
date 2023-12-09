import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                row(),
                row(),
                row(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Row row() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      const SizedBox(
        width: 12,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      const SizedBox(
        width: 12,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    ],
  );
}
