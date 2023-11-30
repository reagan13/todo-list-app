// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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

class calendar extends StatefulWidget {
  const calendar({super.key});

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  int _currentIndex = 0;

  bool isChecked = false;

//ALL the tasks will go in this List
  List<TaskData> tasksToday = [
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
    TaskData(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'priority'),
    // Add more TaskData instances as needed
  ];
  //Widget for the content or the taskss
  Widget displayTasksToday(List<TaskData> today) {
    return today.isEmpty
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
            children: today.map((task) {
              return GestureDetector(
                onTap: task.isChecked
                    ? null // Disable onTap when isChecked is true
                    : () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Tasks()),
                        // );
                      },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  // style: subHeading,
                ),
                Text(
                  'Today',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: DatePicker(
                DateTime.now(),
                height: 80,
                width: 60,
                initialSelectedDate: DateTime.now(),
                selectionColor: Color.fromARGB(255, 91, 89, 247),
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                          'Task',
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
                // ... Other Widgets
                SizedBox(
                  height: 369,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: displayTasksToday(tasksToday),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
