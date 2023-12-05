import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/screen/services/firestore.dart';
import 'package:todo_list_application/widget/no_task.dart';

class ShowTask extends StatefulWidget {
  const ShowTask({super.key});

  @override
  State<ShowTask> createState() => _ShowTaskState();
}

class _ShowTaskState extends State<ShowTask> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('List It Down'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getTaskStream(),
            builder: (context, snapshot) {
              //  if we have data, get all the docs
              if (snapshot.hasData) {
                List taskList = snapshot.data!.docs;

                // display as list

                return ListView.builder(
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      // get each individual doc
                      DocumentSnapshot document = taskList[index];
                      String docID = document.id;

                      // get not from each doc
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String taskText = data['task'];

                      //display as list title
                      return ListTile(
                        title: Text(taskText),
                      );
                    });
              } else {
                return NoTask();
              }
            },
          )),
    );
  }
}
