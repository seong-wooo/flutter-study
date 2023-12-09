import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('TextButton'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: Text('OutlinedButton'),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text('ElevatedButton'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              ),
              GestureDetector(
                onTap: () {
                  print('onTap');
                },
                onDoubleTap: () {
                  print('onDoubleTap');
                },
                onLongPress: () {
                  print('onLongPress');
                },
                child: Icon(Icons.ac_unit_sharp),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Text('클릭'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
