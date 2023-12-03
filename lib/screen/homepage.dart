import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/screen/adddTask.dart';
import 'package:todo_list_application/screen/calendar.dart';
import 'package:todo_list_application/screen/task.dart';
import 'package:todo_list_application/widget/add_button.dart';

import 'package:todo_list_application/widget/header.dart';
import 'package:todo_list_application/widget/no_task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          NoTask(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FloatingActionButton onPressed code here!
          // For example, you can navigate to another page.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const adddTask()),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
