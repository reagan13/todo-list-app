// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_application/screen/homepage.dart';
import 'package:todo_list_application/services/firestoreService.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final user = FirebaseAuth.instance.currentUser!;

  // Intialize the firestore

  final db = FirebaseFirestore.instance;

  // Initialize controller
  final TextEditingController _taskTitle = TextEditingController();
  final TextEditingController _taskContent = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  String _dueTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String? _category = 'Important';
  String chosenCategory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                //TITLE OF THE TASKS
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Title',
                          // style: Heading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 73, 72, 72),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),

                          //TextField Title
                          child: TextField(
                            controller: _taskTitle,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 10),
                              hintText: 'Tasks Title',
                              hintStyle: GoogleFonts.montserrat(
                                color: const Color.fromARGB(255, 128, 127, 127),
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 91, 89, 247),
                                ),
                              ),
                              enabledBorder: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _taskTitle.clear();
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Tasks Content
                      Container(
                        height:
                            150, // Set an appropriate height for your use case
                        margin: EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 73, 72, 72),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextField(
                          controller: _taskContent,
                          maxLines:
                              null, // Set to null or a value greater than 1 for multi-line input
                          keyboardType:
                              TextInputType.multiline, // Enable multiline input
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.all(10), // Adjust padding as needed
                            hintText: 'Tasks Content',
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 128, 127, 127),
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(8.0),
                              ),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none, // No border on focus
                            ),
                          ),
                        ),
                      ),
                      //Due Date Content
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Due Date',
                          // style: Heading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 73, 72, 72),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextField(
                            readOnly: widget == null ? false : true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 10),
                              hintText: DateFormat.yMd().format(_selectedDate),
                              hintStyle: GoogleFonts.montserrat(
                                color: const Color.fromARGB(255, 128, 127, 127),
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 91, 89, 247),
                                ),
                              ),
                              enabledBorder: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _getdueDate();
                                },
                                icon: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //DUE TIME AND PRIORITY LEVEL
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //DUE TIME
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Due Time',
                                  // style: Heading,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  height: 50,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 73, 72, 72),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: TextField(
                                    readOnly: widget == null ? false : true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          right: 10,
                                          bottom: 10),
                                      hintText: _dueTime,
                                      hintStyle: GoogleFonts.montserrat(
                                        color: const Color.fromARGB(
                                            255, 128, 127, 127),
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 91, 89, 247),
                                        ),
                                      ),
                                      enabledBorder: InputBorder.none,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          _getDueTime(isDueTime: true);
                                        },
                                        icon: const Icon(
                                          Icons.access_time_outlined,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //CATEGORY
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Category',
                                  // style: Heading,
                                  //
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  height: 50,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 73, 72, 72),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: DropdownButton<String>(
                                      value: _category,
                                      style: GoogleFonts.montserrat(
                                        color: const Color.fromARGB(
                                            255, 128, 127, 127),
                                        fontSize: 14,
                                      ),
                                      underline: Container(
                                        height: 0,
                                        color: Colors.transparent,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _category = newValue!;
                                          chosenCategory = _category.toString();
                                        });
                                      },
                                      items: <String>[
                                        'Important',
                                        'Normal',
                                        'Least'
                                      ] // Replace with your list of tasks
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 46),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      iconSize: 24,
                                      elevation: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      //Buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Container(
                              height: 50, // Set the desired height
                              width: 335, // Set the desired width
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Confirm Add'),
                                        content: Text(
                                            'Are you sure you want to add task?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              // Dismiss the dialog
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 128, 127, 127),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            child: Text(
                                              'Confirm',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 91, 89, 247),
                                              ),
                                            ),
                                            onPressed: () {
                                              FirestoreService().addTask(
                                                  _taskTitle.text.trim(),
                                                  _taskContent.text.trim(),
                                                  _selectedDate.toString(),
                                                  _dueTime,
                                                  chosenCategory);
                                              // FirestoreService().displayTask();
                                              Navigator.pop(context);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Homepage()));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      "Task Added Successfully"),
                                                  duration: const Duration(
                                                      seconds: 3),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 91, 89,
                                      247), // Background color of the button
                                  onPrimary: Colors.white, // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set border radius
                                  ),
                                ),
                                child: Text(
                                  'Add Task',
                                  style: TextStyle(
                                    fontSize: 16, // Set font size
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 50, // Set the desired height
                              width: 335, // Set the desired width
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .white, // Background color of the button
                                  onPrimary: Color.fromARGB(
                                      255, 91, 89, 247), // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set border radius
                                  ),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16, // Set font size
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: Color.fromARGB(255, 241, 244, 248),
    );
  }

//Due Date
  _getdueDate() async {
    DateTime currentDate = DateTime.now();
    DateTime? _pickDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2017),
      lastDate: DateTime(2100),
      selectableDayPredicate: (DateTime date) {
        // Disable past dates
        return date.isAfter(currentDate.subtract(Duration(days: 1)));
      },
    );

    if (_pickDate != null) {
      setState(() {
        _selectedDate = _pickDate;
      });
    } else {
      return 'Enter Due Date';
    }
  }

//get dueTime
  _getDueTime({required bool isDueTime}) async {
    var pickTime = await _showTimePicker();
    String _formattedTime = pickTime.format(context);
    if (isDueTime == true) {
      setState(() {
        _dueTime = _formattedTime;
      });
    } else {
      return 'Invalid Time';
    }
  }

//Time picker in dueTime
  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_dueTime.split(":")[0]),
            minute: int.parse(_dueTime.split(":")[1].split(" ")[0])));
  }
}
