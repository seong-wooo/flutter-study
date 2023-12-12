import 'package:flutter/material.dart';

import '../constant.dart';

class HomeScreen extends StatelessWidget {
  final int number;

  const HomeScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('assets/images/겨울$number.jpeg'),
        ),
        Text(
          '겨울 사진',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          number.toString(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 60,
            fontWeight: FontWeight.w200,
          ),
        )
      ],
    );
  }
}
