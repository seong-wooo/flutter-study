import 'package:flutter/material.dart';

import '../constant.dart';

class SettingScreen extends StatelessWidget {
  final double threshold;
  final ValueChanged<double> onThresholdChanged;

  const SettingScreen({super.key, required this.threshold, required this.onThresholdChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            '민감도',
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Slider(
          value: threshold,
          onChanged: onThresholdChanged,
          min: 0.1,
          max: 10.0,
          divisions: 101,
          label: threshold.toStringAsFixed(1),
        ),
      ],
    );
  }
}
