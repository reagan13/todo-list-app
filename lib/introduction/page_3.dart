// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: () => {}, child: Text('Skip'))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                'https://clickup.com/blog/wp-content/uploads/2022/08/obsidian-vs-notion.png',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      'Organize Your Tasks',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "Organizing your tasks effectively, managing your to-do list to ensure efficient and timely completion.",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 50, // Set the desired height
              width: 335, // Set the desired width
              child: ElevatedButton(
                onPressed: () => {
                  //handle button press
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 91, 89, 247), // Background color of the button
                  onPrimary: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Set border radius
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 16, // Set font size
                  ),
                ),
              ),
            ),
            // const Text(
            //   'qwerty',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            // const Text(
            //   "List It Down is your go-to todo list app, empowering you to effortlessly manage your daily tasks. It's your free companion for staying organized, boosting productivity, and making every day count.",
            //   style: TextStyle(fontSize: 12),
            //   textAlign: TextAlign.center,
            // ),
            // TextButton(onPressed: () {}, child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
