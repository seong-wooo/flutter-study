import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
            // SizedBox는 자식 위젯의 크기를 제한하는 위젯입니다.
          child: SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
