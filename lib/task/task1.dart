// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskToday {
  bool isChecked;
  String title;
  String date;
  String prio;

  TaskToday({
    required this.isChecked,
    required this.title,
    required this.date,
    required this.prio,
  });
}

class task1 extends StatefulWidget {
  const task1({super.key});

  @override
  State<task1> createState() => _task1State();
}

class _task1State extends State<task1> {
  bool isChecked = false;
  bool showCheckbox = false;
  List<TaskToday> tasksToday = [
    TaskToday(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'Least priority'),
    TaskToday(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'Least priority'),
    TaskToday(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'priority'),
    TaskToday(
        isChecked: false,
        title: 'Update Our Command Palette to be more usable.',
        date: '18 Jan, 2023',
        prio: 'priority'),
    // Add more TaskData instances as needed
  ];
  //Widget for the content or the taskss

  Widget displayTasksToday(List<TaskToday> today) {
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
                //To show CheckBox
                onLongPress: () {
                  setState(() {
                    showCheckbox = true;
                  });
                },
                //To hide CheckBox
                onDoubleTap: () => {
                  setState(() {
                    showCheckbox = false;
                  })
                },
                onTap: task.isChecked
                    ? null // Disable onTap when isChecked is true
                    : () => {
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
                              if (showCheckbox)
                                Checkbox(
                                  value: task
                                      .isChecked, // Set the initial value as needed
                                  onChanged: (bool? value) {
                                    // Handle checkbox state change
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Current Tasks',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 69, 69, 69)),
              ),
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
    );
  }
}
