import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/services/firestoreService.dart';
import 'package:todo_list_application/task/addtask.dart';
import 'package:todo_list_application/task/editTask.dart';
import 'package:todo_list_application/task/no_task.dart';

class ShowTask extends StatefulWidget {
  const ShowTask({super.key});

  @override
  State<ShowTask> createState() => _ShowTaskState();
}

class _ShowTaskState extends State<ShowTask> {
  final FirestoreService firestoreService = FirestoreService();
  String taskText = "";
  String taskContent = "";
  String taskCategory = "";
  String taskTime = "";
  String taskDate = "";
  String taskTimeStamp = "";

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
                  var docId = snapshot.data!.docs[index].id;
                  // get each indivudal doc
                  DocumentSnapshot document = taskList[index];
                  // String docId = document.id;

                  // get task from each doc
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String taskText = data['title'];
                  String taskContent = data['description'];
                  String taskCategory = data['category'];
                  String taskTime = data['time'];
                  String taskDate = data['date'];
                  String taskTimeStamp = data['timestamp'].toString();

                  // display as list tile
                  return ListTile(
                    title: Text(taskText),
                    subtitle: Text(taskContent),
                    onTap: () {
                      // tap to show task\
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(taskText),
                            content: Column(
                              children: [
                                Text("Description: $taskContent"),
                                Text("Category: $taskCategory"),
                                Text("Due Time: $taskTime"),
                                Text("Date: $taskDate"),
                                Text("Task Created: $taskTimeStamp"),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Edit'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditTask(
                                              TaskTitle: taskText,
                                              TaskContent: taskContent,
                                              TaskCategory: taskCategory,
                                              TaskTime: taskTime,
                                              TaskDate: taskDate,
                                              TaskTimeStamp: taskTimeStamp,
                                              TaskDocId: docId)));
                                },
                              ),
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  // Dismiss the dialog
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
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
