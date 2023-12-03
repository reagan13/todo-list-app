// ignore_for_file: prefer_final_fields, prefer_const_constructors, camel_case_types, avoid_print, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskData {
  bool isChecked;
  String title;
  String date;
  String prio;

  TaskData({
    required this.isChecked,
    required this.title,
    required this.date,
    required this.prio,
  });
}

class allTask extends StatefulWidget {
  const allTask({Key? key}) : super(key: key);

  @override
  State<allTask> createState() => _allTaskState();
}

class _allTaskState extends State<allTask> {
  // bool _isSearching = false;
  int _currentIndex = 0;
  bool isChecked = false;

  List<TaskData> tasks = [
    TaskData(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'Least priority'),
    TaskData(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'Least priority'),
    TaskData(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'priority'),

    // Add more TaskData instances as needed
  ];
  List<TaskData> completed = [
    TaskData(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'priority'),
    // Add more TaskData instances as needed
  ];
  List<TaskData> deleted = [
    TaskData(
        isChecked: false,
        title: 'asdasdsa.',
        date: '18 Nov, 2023',
        prio: 'priority'),
    TaskData(
        isChecked: false,
        title: 'asdasdasjkbnasjkbdsa.',
        date: '18 Feb, 2023',
        prio: 'priority'),
    // Add more TaskData instances as needed
  ];

  TextEditingController _searchController = TextEditingController();
//For Display allTasks
  Widget displayTasks(List<TaskData> tasks) {
    return tasks.isEmpty
        ? Center(
            child: Column(
              children: [
                Icon(
                  Icons.event_note_outlined, // Replace with the desired icon
                  size: 100,
                  color: Color.fromARGB(255, 91, 89, 247),
                ),
                Text(
                  'No Tasks Today',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 63, 62, 62),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: tasks.map((task) {
              return GestureDetector(
                onTap: task.isChecked
                    ? null // Disable onTap when isChecked is true
                    : () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: task.isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    task.isChecked = value ?? false;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 91, 89, 247),
                              ),
                              Expanded(
                                child: ClipRect(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          decoration: task.isChecked
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              task.date,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: task.isChecked
                                                    ? Colors.grey
                                                        .withOpacity(0.5)
                                                    : Colors.grey,
                                              ),
                                            ),
                                            Container(
                                              height: 28,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 241, 244, 248),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 0, 8, 0),
                                                  child: Text(
                                                    task.prio,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: task.isChecked
                                                          ? Colors.grey
                                                              .withOpacity(0.5)
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
  }

  //For Completed tasks display
  Widget displaycompleted(List<TaskData> completed) {
    return tasks.isEmpty
        ? Center(
            child: Column(
              children: [
                Icon(
                  Icons.event_note_outlined, // Replace with the desired icon
                  size: 100,
                  color: Color.fromARGB(255, 91, 89, 247),
                ),
                Text(
                  'No Completed Tasks',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 63, 62, 62),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: completed.map((completed) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ClipRect(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        completed.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              completed.date,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Container(
                                              height: 28,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 241, 244, 248),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 0, 8, 0),
                                                  child: Text(
                                                    completed.prio,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
  }

  //For Deleted tasks display
  Widget displayDeleted(List<TaskData> deleted) {
    return deleted.isEmpty
        ? Center(
            child: Column(
              children: [
                Icon(
                  Icons.event_note_outlined, // Replace with the desired icon
                  size: 100,
                  color: Color.fromARGB(255, 91, 89, 247),
                ),
                Text(
                  'No Deleted Tasks',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 63, 62, 62),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: deleted.map((deleted) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ClipRect(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        deleted.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              deleted.date,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Container(
                                              height: 28,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 241, 244, 248),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 0, 8, 0),
                                                  child: Text(
                                                    deleted.prio,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 241, 244, 248),
      //   title: _isSearching
      //       ? _SearchTextField()
      //       : Align(
      //           alignment: Alignment.topLeft,
      //           child: Container(
      //             width: 200, // Adjust the width as needed
      //             child: Text(
      //               'Tasks',
      //               style: TextStyle(
      //                 color: Color.fromARGB(255, 41, 41, 41),
      //                 fontSize: 22,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ),
      //         ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
      //       child: IconButton(
      //         onPressed: () {
      //           setState(() {
      //             _isSearching = !_isSearching;
      //           });
      //         },
      //         icon: Icon(
      //           Icons.search_sharp,
      //           color: Color.fromARGB(255, 41, 41, 41),
      //           size: 24,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 20),
            child: Container(
              width: 200, // Adjust the width as needed
              child: Text(
                'Tasks',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          //All Tasks
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      15,
                      0,
                      0,
                      0,
                    ),
                    child: Icon(
                      Icons.task_sharp,
                      color: Color.fromARGB(255, 91, 89, 247),
                      size: 25,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        12,
                        0,
                        0,
                        0,
                      ),
                      child: Text(
                        'All Tasks',
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(
                          '12',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: tasks.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons
                                  .event_note_outlined, // Replace with the desired icon
                              size: 100,
                              color: Color.fromARGB(255, 91, 89, 247),
                            ),
                            Text(
                              'No Tasks Today',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 63, 62, 62),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          height: 250,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: displayTasks(tasks),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          //Completed Tasks
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        15,
                        0,
                        0,
                        0,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Color.fromARGB(255, 51, 133, 33),
                        size: 25,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          12,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Text(
                            '12',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: completed.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons
                                    .assignment_turned_in, // Replace with the desired icon
                                size: 100,
                                color: Color.fromARGB(255, 51, 133, 33),
                              ),
                              Text(
                                'No Completed Tasks',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 63, 62, 62),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            height: 250,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: displaycompleted(completed),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          //Deleted
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        15,
                        0,
                        0,
                        0,
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 216, 45, 48),
                        size: 25,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          12,
                          0,
                          0,
                          0,
                        ),
                        child: Text(
                          'Deleted',
                          style: TextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Text(
                            '12',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: deleted.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons
                                    .event_busy, // Replace with the desired icon
                                size: 100,
                                color: Color.fromARGB(255, 216, 45, 48),
                              ),
                              Text(
                                'No Deleted Tasks',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 63, 62, 62),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            height: 250,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: displayDeleted(deleted),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _SearchTextField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _searchController.clear();
            });
          },
        ),
      ),
    );
  }
}
