import 'dart:async';

import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(milliseconds: 300),
      (timer) {
        var currentPage = pageController.page?.toInt();

        if (currentPage == null || currentPage == 3) {
          currentPage = 0;
        } else {
          currentPage++;
        }

        pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: pageController,
      children: [
        Image.network(
          'https://avatars.githubusercontent.com/u/79205414?v=4',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/겨울2.jpeg',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/겨울3.jpeg',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/겨울4.jpeg',
          fit: BoxFit.contain,
        ),
      ],
    ));
  }
}
