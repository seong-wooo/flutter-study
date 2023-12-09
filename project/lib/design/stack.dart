import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.blue,
              ),
            ],
          ),
        )
      ),
    ),
  );
}
