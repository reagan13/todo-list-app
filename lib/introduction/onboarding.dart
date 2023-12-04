// ignore_for_file: unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/login/login-raw1.dart';
import 'package:todo_list_application/authentication/login/login.dart';
import 'package:todo_list_application/introduction/cover_page.dart';
import 'package:todo_list_application/introduction/page_1.dart';
import 'package:todo_list_application/introduction/page_2.dart';
import 'package:todo_list_application/introduction/page_3.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = [
    const CoverPage(),
    const Page1(),
    const Page2(),
    const Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          )
        ],
      ),
    );
  }
}
