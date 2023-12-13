import 'package:flutter/material.dart';
import 'package:todo_list_application/services/firestoreService.dart';
import 'package:todo_list_application/task/addtask.dart';
import 'package:todo_list_application/screen/calendar.dart';

class NoTask extends StatelessWidget {
  const NoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            child: Align(
              alignment: Alignment.center,
              child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/011/360/558/original/pencil-and-notes-cartoon-icon-illustration-education-object-icon-concept-isolated-premium-flat-cartoon-style-vector.jpg',
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
                      MaterialPageRoute(builder: (context) => const AddTask()),
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
      ),
    );
  }
}
