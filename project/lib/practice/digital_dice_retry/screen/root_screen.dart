import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/practice/digital_dice_retry/screen/home_screen.dart';
import 'package:project/practice/digital_dice_retry/screen/setting_screen.dart';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  int number = 1;
  double threshold = 2.7;
  ShakeDetector? shakeDetector;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: onPhoneShake,
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
    );
  }

  void tabListener() => setState(() => print('페이지 이동!'));

  void onPhoneShake() {
    final rand = Random();
    setState(() => number = rand.nextInt(4) + 1);
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          HomeScreen(number: number),
          SettingScreen(
            threshold: threshold,
            onThresholdChanged: (double value) =>
                setState(() => threshold = value),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller!.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_sharp),
            label: '1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.back_hand_sharp),
            label: '2',
          )
        ],
      ),
    );
  }
}
