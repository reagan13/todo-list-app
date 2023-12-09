// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:todo_list_application/task/editTask.dart';

class task1 extends StatefulWidget {
  const task1({super.key});

  @override
  State<task1> createState() => _task1State();
}

class _task1State extends State<task1> {
  bool isChecked = false;
  bool showCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'as',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 69, 69, 69)),
                  ),
                ),
                // ... Other Widgets
                SizedBox(
                  // height: 369,
                  child: Container(
                    child: GestureDetector(
                      //CheckBox Visible
                      onLongPress: _handLongPress,
                      //CheckBox hide
                      onDoubleTap: _handleDoubleTap,
                      onTap: () {
                        // show add task
                        showTask(context);
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
                                    //checkbox Condition
                                    if (showCheckbox)
                                      Checkbox(
                                        value:
                                            isChecked, // Set the initial value as needed
                                        onChanged: (bool? value) {
                                          // Handle checkbox state change
                                          setState(() {
                                            isChecked = value ?? false;
                                          });
                                        },
                                        activeColor:
                                            Color.fromARGB(255, 91, 89, 247),
                                      ),
                                    Expanded(
                                      child: ClipRect(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Update Our Command Palette to be more usable.',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                decoration: isChecked
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 6, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '18 Jan, 2023',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: isChecked
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
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                8, 0, 8, 0),
                                                        child: Text(
                                                          'priority',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: isChecked
                                                                ? Colors.grey
                                                                    .withOpacity(
                                                                        0.5)
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

//ss
  //checkbox visibility true
  void _handLongPress() => {
        setState(() {
          showCheckbox = true;
        })
      };
//checkbox visibility false
  void _handleDoubleTap() => {
        setState(() {
          showCheckbox = false;
        })
      };
//checkbox
  void _handleOntap() => {};
}

Future<dynamic> showTask(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.orangeAccent,
          title: Text('Title task'),
          content: Text('description'),
          actions: [
            TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EditTask()),
                  // );
                },
                child: Text('Edit Task')),
            TextButton(onPressed: () {}, child: Text('Close'))
          ],
        );
      });
}
