import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/services/firestoreService.dart';
import 'package:todo_list_application/task/addtask.dart';
import 'package:todo_list_application/task/no_task.dart';
import 'package:todo_list_application/task/task1.dart';

class ShowTask extends StatefulWidget {
  const ShowTask({super.key});

  @override
  State<ShowTask> createState() => _ShowTaskState();
}

class _ShowTaskState extends State<ShowTask> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // display tasks
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().stream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List taskList = snapshot.data!.docs;

            // display as list
            return ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  // get each indivudal doc
                  DocumentSnapshot document = taskList[index];
                  String docId = document.id;
                  // get tak from each doc
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String taskText = data['title'];
                  String taskContent = data['description'];

                  // display as list tile
                  return ListTile(
                    title: Text(taskText),
                    subtitle: Text(taskContent),
                    trailing: Icon(Icons.settings),
                  );
                });
          } else {
            // Placeholder or loading indicator when snapshot has no data
            return ShowTask();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FloatingActionButton onPressed code here!
          // For example, you can navigate to another page.
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTask()));
        },
        backgroundColor: Color.fromARGB(255, 91, 89, 247),
        shape: CircleBorder(),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
