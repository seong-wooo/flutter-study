import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/practice/digital_dice/screen/setting_screen.dart';
import 'package:shake/shake.dart';

import 'home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7;
  int number = 1;
  ShakeDetector? detector;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
    detector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
      onPhoneShake: onPhoneShake,

    );
  }

  void onPhoneShake() {
    final rand = Random();
    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  tabListener() {
    setState(() {
      print('zzzzzzz');
    });
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    detector!.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      // 탭 화면을 보여줄 위젯

      bottomNavigationBar: renderBottomNavigation(), // 아래 탭 내비게이션을 구현하는 매개변수
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: number),
      SettingScreen(
        threshold: threshold,
        onThresholdChanged: (value) => setState(() => threshold = value),
      ),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    // 탭 네비게이션을 구현하는 위젯
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (index) => setState(() => controller!.animateTo(index)),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.edgesensor_high_outlined),
          label: '주사위',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ],
    );
  }
}
