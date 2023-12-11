import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DDayScreen extends StatefulWidget {
  const DDayScreen({super.key});

  @override
  State<DDayScreen> createState() => _DDayScreenState();
}

class _DDayScreenState extends State<DDayScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('study hard', style: textTheme.displayLarge),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _DDay(
              firstDay: firstDay,
              onBookPressed: onBookPressed,
            ),
            _MyImage(),
          ],
        ),
      ),
    );
  }

  void onBookPressed() {
    showCupertinoDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.5,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: firstDay,
            onDateTimeChanged: (DateTime value) =>
                setState(() => firstDay = value),
            maximumDate: DateTime.now(),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {
  final DateTime firstDay;
  final VoidCallback onBookPressed;

  const _DDay({super.key, required this.firstDay, required this.onBookPressed});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          '오늘은 ${today.year}년 ${today.month}월 ${today.day}일',
          style: textTheme.displayMedium,
        ),
        Text(
          '시작일은 ${firstDay.year}년 ${firstDay.month}월 ${firstDay.day}일',
          style: textTheme.displayMedium,
        ),
        Text(
          'D+${DateTime.now().difference(firstDay).inDays + 1}',
          style: textTheme.displayMedium,
        ),
        IconButton(
          onPressed: onBookPressed,
          icon: Icon(Icons.book),
          iconSize: MediaQuery.of(context).size.width * 0.1,
        ),
      ],
    );
  }
}

class _MyImage extends StatefulWidget {
  const _MyImage({super.key});

  @override
  State<_MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<_MyImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network('https://avatars.githubusercontent.com/u/79205414?v=4',
        height: MediaQuery.of(context).size.height * 0.3);
  }
}
