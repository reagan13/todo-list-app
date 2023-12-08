// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Key? key;

  const ProfileWidget({
    this.key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
      child: Container(
        height: 50,
        width: 335,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Icon(
                      icon,
                      color: const Color.fromARGB(255, 63, 62, 62),
                      size: 28,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 63, 62, 62),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: const Color.fromARGB(255, 63, 62, 62),
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
