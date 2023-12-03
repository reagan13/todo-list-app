// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
                'https://clickup.com/blog/wp-content/uploads/2022/06/meeting-notes.png',
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
                      'Create Your Daily Tasks',
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
                        "In List It Down, you can create your personalized daily tasks to stay productive ",
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
            // const Text(
            //   'Create Your Daily Tasks',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            // const Text(
            //   "In List It Down, you can create your personalized daily tasks to stay productive ",
            //   style: TextStyle(fontSize: 12),
            //   textAlign: TextAlign.center,
            // ),
            // TextButton(
            //     onPressed: () {
            //       // Navigator.push(
            //       //   context,
            //       //   MaterialPageRoute(builder: (context) => const Page3()),
            //       // );
            //     },
            //     child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
