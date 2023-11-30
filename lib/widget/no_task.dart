import 'package:flutter/material.dart';
import 'package:todo_list_application/screen/calendar.dart';

class NoTask extends StatelessWidget {
  const NoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              '..//lib/images/take-note.jpg',
              height: 400,
              width: 400,
            ),
          ),
        ),
        const Text(
          "Ready to conquer your day? What's on your agenda",
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tap',
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                child: const Text(
                  ' + ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white30),
                ),
                onTap: () {
                  Navigator.push(
                    // go to create task page
                    context,
                    MaterialPageRoute(builder: (context) => const calendar()),
                  );
                },
              ),
              const Text(
                'to add a task.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
