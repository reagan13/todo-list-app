// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/logout.dart';
import 'package:todo_list_application/screen/homepage.dart';
import 'package:todo_list_application/screen/profile.dart';
import 'package:todo_list_application/services/firestoreService.dart';
import 'package:todo_list_application/task/addtask.dart';
import 'package:todo_list_application/screen/calendar.dart';
import 'package:todo_list_application/screen/task.dart';
import 'package:todo_list_application/task/editTask.dart';
import 'package:todo_list_application/task/showtask.dart';

import 'package:todo_list_application/task/no_task.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final FirestoreService firestoreService = FirestoreService();
  String taskText = "";
  String taskContent = "";
  String taskCategory = "";
  String taskTime = "";
  String taskDate = "";
  String taskTimeStamp = "";
  String docId = '';
  bool isChecked = false;
  bool showCheckbox = false;

  bool standardSelected = false;
  Set<int> selectedIndex = Set<int>();

  //Alert Dialog Widget in Task Content
  Widget taskWidget(
      {required String taskText,
      required String taskContent,
      required String taskCategory,
      required String taskTime,
      required String taskDate,
      required String taskTimeStamp,
      required String docId}) {
    // Your logic for taskWidget goes here
    return AlertDialog(
      title: Text(
        taskText,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Description
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Description: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  //$taskContent
                  TextSpan(
                    text: taskContent,
                    style: DefaultTextStyle.of(context).style,
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 15,
            ),
            //Category
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Category: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  //$taskCategory
                  TextSpan(
                    text: taskCategory,
                    style: DefaultTextStyle.of(context).style,
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 15,
            ),
            //Due Time
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Due Time: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  //$taskTime
                  TextSpan(
                    text: taskTime,
                    style: DefaultTextStyle.of(context).style,
                  ),
                ],
              ),
            ),

            //Space
            SizedBox(
              height: 15,
            ),
            //taskDate
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Date: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  //$taskDate
                  TextSpan(
                    text: taskDate,
                    style: DefaultTextStyle.of(context).style,
                  ),
                ],
              ),
            ),

            //Space
            SizedBox(
              height: 15,
            ),
            //taskDate
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Task Created: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  //$taskDate
                  TextSpan(
                    text: taskTimeStamp,
                    style: DefaultTextStyle.of(context).style,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
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
            icon: Icon(
              Icons.edit,
              size: 28,
              // color: Colors.red,
            )),
        IconButton(
            onPressed: () {
              //handle delete task content
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Task'),
                    content: Text('Are you sure you want to delete the task?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 128, 127, 127),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          FirestoreService().deleteTask(docId);
                          FirestoreService().archiveDeletedTask(
                              taskText,
                              taskContent,
                              taskDate,
                              taskTime,
                              taskCategory,
                              docId);

                          // Dismiss the dialog
                          Navigator.of(context).pop();

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Homepage()));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Task Delete Successfully"),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Color.fromARGB(255, 91, 89, 247),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete,
              size: 28,
              // color: Colors.red,
            )),
        IconButton(
          onPressed: () {
            // Dismiss the dialog
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 28.0,
            // color: Color.fromARGB(
            //     255, 91, 89, 247),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //checkbox visibility true
    void _handLongPress() {
      setState(() {
        showCheckbox = true;
      });
    }

    //checkbox visibility false
    void _handleDoubleTap() {
      setState(() {
        setState(() {
          showCheckbox = false;
          selectedIndex.clear();
        });
      });
    }

// Define a function to get the color based on the category
    Color getCategoryColor(String category) {
      switch (category.toLowerCase()) {
        case 'important':
          return Color.fromARGB(255, 179, 19, 18);
        case 'normal':
          return Color.fromARGB(255, 178, 164, 255);
        case 'least':
          return Color.fromARGB(255, 92, 84, 112);
        default:
          return Color.fromARGB(0, 194, 45, 132);
      }
    }

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 241, 234, 255),
          toolbarHeight: 5,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Priority Task"),
              ),
              Tab(
                child: Text("Normal Task"),
              ),
              Tab(
                child: Text("Least Priority"),
              ),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirestoreService().stream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              List taskList = snapshot.data!.docs;

              return TabBarView(
                children: <Widget>[
                  // Priority Tab

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.task_rounded,
                                  color: getCategoryColor(
                                    'Important',
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Pending Tasks',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            //number of tasks
                            Container(
                              height: 28,
                              decoration: BoxDecoration(
                                color: getCategoryColor(
                                  'Important',
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    '12',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: taskList.length,
                          itemBuilder: (context, index) {
                            // Your Priority Tab logic here
                            var docId = snapshot.data!.docs[index].id;
                            // get each indivudal doc
                            DocumentSnapshot document = taskList[index];
                            // String docId = document.id;

                            // get task from each doc
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == 'Important') {
                              String taskText = data['title'];
                              String taskContent = data['description'];
                              String taskCategory = data['category'];
                              String taskTime = data['time'];

                              String taskDate = data['date'];
                              String taskTimeStamp =
                                  data['timestamp'].toString();

                              // display as list tile
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  //showCheckBox
                                  onLongPress: () {
                                    _handLongPress();
                                  },
                                  //hideCheckBox
                                  onDoubleTap: () {
                                    _handleDoubleTap();
                                  },
                                  //Modal Content
                                  onTap: () {
                                    //Modal Content
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return taskWidget(
                                            taskText: taskText,
                                            taskContent: taskContent,
                                            taskCategory: taskCategory,
                                            taskTime: taskTime,
                                            taskDate: taskDate,
                                            taskTimeStamp: taskTimeStamp,
                                            docId: docId);
                                      },
                                    );
                                  },
                                  //LIST BOX CONTENT
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes the position of the shadow
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
                                            child: Container(
                                              color:
                                                  Colors.white.withOpacity(1),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Wrap(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: showCheckbox
                                                              ? Checkbox(
                                                                  value: selectedIndex
                                                                      .contains(
                                                                          index),
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      if (value !=
                                                                              null &&
                                                                          value) {
                                                                        selectedIndex
                                                                            .add(index);
                                                                      } else {
                                                                        selectedIndex
                                                                            .remove(index);
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          91,
                                                                          89,
                                                                          247),
                                                                )
                                                              : null,
                                                        ),
                                                        Expanded(
                                                            child: ClipRRect(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    taskText,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 13,
                                                                  ),
                                                                  Text(
                                                                    taskDate,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Row(
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        IconButton(
                                                                          isSelected:
                                                                              standardSelected,
                                                                          onPressed:
                                                                              () {
                                                                            //handle completed task
                                                                            setState(() {
                                                                              standardSelected = !standardSelected;
                                                                            });

                                                                            showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return AlertDialog(
                                                                                  title: Text('Mark as Complete'),
                                                                                  actions: <Widget>[
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        // Dismiss the dialog
                                                                                        Navigator.of(context).pop();

                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShowTask()));
                                                                                      },
                                                                                      child: Text(
                                                                                        'Cancel',
                                                                                        style: TextStyle(
                                                                                          color: const Color.fromARGB(255, 128, 127, 127),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        FirestoreService().markComplete(taskText, taskContent, taskDate, taskTime, taskCategory, docId);

                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage()));

                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text("Task Mark Completed"),
                                                                                            duration: const Duration(seconds: 3),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        'Confirm',
                                                                                        style: TextStyle(
                                                                                          color: Color.fromARGB(255, 91, 89, 247),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          selectedIcon:
                                                                              const Icon(
                                                                            Icons.flag,
                                                                            color:
                                                                                Colors.greenAccent,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.flag_outlined,
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              28,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                getCategoryColor(taskCategory),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                                                              child: Text(
                                                                                taskCategory,
                                                                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // Placeholder or loading indicator when snapshot has no data
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  // Normal Tab
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.task_rounded,
                                  color: getCategoryColor(
                                    'Normal',
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Pending Tasks',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            //number of tasks
                            Container(
                              height: 28,
                              decoration: BoxDecoration(
                                color: getCategoryColor(
                                  'Normal',
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    '12',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: taskList.length,
                          itemBuilder: (context, index) {
                            // Your Priority Tab logic here
                            var docId = snapshot.data!.docs[index].id;
                            // get each indivudal doc
                            DocumentSnapshot document = taskList[index];
                            // String docId = document.id;

                            // get task from each doc
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == 'Normal') {
                              String taskText = data['title'];
                              String taskContent = data['description'];
                              String taskCategory = data['category'];
                              String taskTime = data['time'];

                              String taskDate = data['date'];
                              String taskTimeStamp =
                                  data['timestamp'].toString();

                              // display as list tile
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  //showCheckBox
                                  onLongPress: () {
                                    _handLongPress();
                                  },
                                  //hideCheckBox
                                  onDoubleTap: () {
                                    _handleDoubleTap();
                                  },
                                  //Modal Content
                                  onTap: () {
                                    //Modal Content
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return taskWidget(
                                            taskText: taskText,
                                            taskContent: taskContent,
                                            taskCategory: taskCategory,
                                            taskTime: taskTime,
                                            taskDate: taskDate,
                                            taskTimeStamp: taskTimeStamp,
                                            docId: docId);
                                      },
                                    );
                                  },
                                  //LIST BOX CONTENT
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes the position of the shadow
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
                                            child: Container(
                                              color:
                                                  Colors.white.withOpacity(1),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Wrap(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: showCheckbox
                                                              ? Checkbox(
                                                                  value: selectedIndex
                                                                      .contains(
                                                                          index),
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      if (value !=
                                                                              null &&
                                                                          value) {
                                                                        selectedIndex
                                                                            .add(index);
                                                                      } else {
                                                                        selectedIndex
                                                                            .remove(index);
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          91,
                                                                          89,
                                                                          247),
                                                                )
                                                              : null,
                                                        ),
                                                        Expanded(
                                                            child: ClipRRect(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    taskText,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 13,
                                                                  ),
                                                                  Text(
                                                                    taskDate,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Row(
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        IconButton(
                                                                          isSelected:
                                                                              standardSelected,
                                                                          onPressed:
                                                                              () {
                                                                            //handle completed task
                                                                            setState(() {
                                                                              standardSelected = !standardSelected;
                                                                            });

                                                                            showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return AlertDialog(
                                                                                  title: Text('Mark as Complete'),
                                                                                  actions: <Widget>[
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        // Dismiss the dialog
                                                                                        Navigator.of(context).pop();

                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShowTask()));
                                                                                      },
                                                                                      child: Text(
                                                                                        'Cancel',
                                                                                        style: TextStyle(
                                                                                          color: const Color.fromARGB(255, 128, 127, 127),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        FirestoreService().markComplete(taskText, taskContent, taskDate, taskTime, taskCategory, docId);

                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage()));

                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text("Task Mark Completed"),
                                                                                            duration: const Duration(seconds: 3),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        'Confirm',
                                                                                        style: TextStyle(
                                                                                          color: Color.fromARGB(255, 91, 89, 247),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          selectedIcon:
                                                                              const Icon(
                                                                            Icons.flag,
                                                                            color:
                                                                                Colors.greenAccent,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.flag_outlined,
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              28,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                getCategoryColor(taskCategory),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                                                              child: Text(
                                                                                taskCategory,
                                                                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // Placeholder or loading indicator when snapshot has no data
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  // Least Priority Tab
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.task_rounded,
                                  color: getCategoryColor(
                                    'Least',
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Pending Tasks',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            //number of tasks
                            Container(
                              height: 28,
                              decoration: BoxDecoration(
                                color: getCategoryColor(
                                  'Least',
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    '12',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: taskList.length,
                          itemBuilder: (context, index) {
                            // Your Priority Tab logic here
                            var docId = snapshot.data!.docs[index].id;
                            // get each indivudal doc
                            DocumentSnapshot document = taskList[index];
                            // String docId = document.id;

                            // get task from each doc
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            if (data['category'] == 'Least') {
                              String taskText = data['title'];
                              String taskContent = data['description'];
                              String taskCategory = data['category'];
                              String taskTime = data['time'];

                              String taskDate = data['date'];
                              String taskTimeStamp =
                                  data['timestamp'].toString();

                              // display as list tile
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  //showCheckBox
                                  onLongPress: () {
                                    _handLongPress();
                                  },
                                  //hideCheckBox
                                  onDoubleTap: () {
                                    _handleDoubleTap();
                                  },
                                  //Modal Content
                                  onTap: () {
                                    //Modal Content
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return taskWidget(
                                            taskText: taskText,
                                            taskContent: taskContent,
                                            taskCategory: taskCategory,
                                            taskTime: taskTime,
                                            taskDate: taskDate,
                                            taskTimeStamp: taskTimeStamp,
                                            docId: docId);
                                      },
                                    );
                                  },
                                  //LIST BOX CONTENT
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes the position of the shadow
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
                                            child: Container(
                                              color:
                                                  Colors.white.withOpacity(1),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Wrap(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: showCheckbox
                                                              ? Checkbox(
                                                                  value: selectedIndex
                                                                      .contains(
                                                                          index),
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      if (value !=
                                                                              null &&
                                                                          value) {
                                                                        selectedIndex
                                                                            .add(index);
                                                                      } else {
                                                                        selectedIndex
                                                                            .remove(index);
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          91,
                                                                          89,
                                                                          247),
                                                                )
                                                              : null,
                                                        ),
                                                        Expanded(
                                                            child: ClipRRect(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    taskText,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 13,
                                                                  ),
                                                                  Text(
                                                                    taskDate,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Row(
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        IconButton(
                                                                          isSelected:
                                                                              standardSelected,
                                                                          onPressed:
                                                                              () {
                                                                            //handle completed task
                                                                            setState(() {
                                                                              standardSelected = !standardSelected;
                                                                            });

                                                                            showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return AlertDialog(
                                                                                  title: Text('Mark as Complete'),
                                                                                  actions: <Widget>[
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        // Dismiss the dialog
                                                                                        Navigator.of(context).pop();

                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShowTask()));
                                                                                      },
                                                                                      child: Text(
                                                                                        'Cancel',
                                                                                        style: TextStyle(
                                                                                          color: const Color.fromARGB(255, 128, 127, 127),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        FirestoreService().markComplete(taskText, taskContent, taskDate, taskTime, taskCategory, docId);

                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage()));

                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text("Task Mark Completed"),
                                                                                            duration: const Duration(seconds: 3),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      child: Text(
                                                                                        'Confirm',
                                                                                        style: TextStyle(
                                                                                          color: Color.fromARGB(255, 91, 89, 247),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          selectedIcon:
                                                                              const Icon(
                                                                            Icons.flag,
                                                                            color:
                                                                                Colors.greenAccent,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.flag_outlined,
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              28,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                getCategoryColor(taskCategory),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                                                              child: Text(
                                                                                taskCategory,
                                                                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // Placeholder or loading indicator when snapshot has no data
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
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
          backgroundColor: Color.fromARGB(255, 178, 164, 255),
          shape: CircleBorder(),
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
        backgroundColor: const Color.fromARGB(255, 241, 234, 255),
      ),
    );
  }
}
