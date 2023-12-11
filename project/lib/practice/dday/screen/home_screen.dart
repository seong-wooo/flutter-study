import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white,
          height: 300,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: firstDay,
            onDateTimeChanged: (date) => setState(() => firstDay = date),
            maximumDate: DateTime.now(),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {
  final VoidCallback onHeartPressed;
  final DateTime firstDay;

  const _DDay(
      {super.key, required this.onHeartPressed, required this.firstDay});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          'U & I',
          style: textTheme.displayLarge,
        ),
        const SizedBox(height: 10),
        Text(
          '우리 처음만난 날',
          style: textTheme.displayMedium,
        ),
        Text(
          '${firstDay.year}년 ${firstDay.month}월 ${firstDay.day}일',
          style: textTheme.displaySmall,
        ),
        IconButton(
          onPressed: onHeartPressed,
          iconSize: 60,
          icon: Icon(Icons.favorite),
          color: Colors.red,
        ),
        const SizedBox(height: 10),
        Text(
          'D + ${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.displayMedium,
        )
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'assets/images/heart.png',
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
