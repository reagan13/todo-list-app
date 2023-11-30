// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_application/screen/adddTask.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  int _currentIndex = 0;
  bool isDarkModeEnabled =
      false; // This is the state that will control the Switch

// ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blueAccent,
                        child: Image.asset(
                          'lib/image/download.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Kim Leones',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 17, 17, 17),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'kimleones@gmail.com',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1, // Set the height of the divider
                  color: Colors.grey, // Set the color of the divider
                  margin: EdgeInsets.symmetric(
                      vertical: 10), // Set margin if needed
                ),
              ],
            ),
          ),
          //PROFILE BUTTON
          GestureDetector(
            onTap: () {
              // Handle the click event, for example, navigate to the profile screen
              print('Click Profile');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Container(
                height: 50,
                width: 335,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.account_circle,
                          color: const Color.fromARGB(255, 63, 62, 62),
                          size: 24,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Profile',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 63, 62, 62),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //DarkMode Button
          GestureDetector(
            onTap: () {
              // Handle the click event, for example, toggle dark mode
              setState(() {
                isDarkModeEnabled = !isDarkModeEnabled;
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Container(
                height: 70,
                width: 335,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.dark_mode,
                          color: const Color.fromARGB(255, 63, 62, 62),
                          size: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SwitchListTile(
                        title: Text(
                          'Dark Mode',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 63, 62, 62),
                            ),
                          ),
                        ),
                        value: isDarkModeEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            isDarkModeEnabled = value;
                          });
                          // Add logic to handle the switch state change, for example, toggle dark mode
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 50, // Set the desired height
              width: 335, // Set the desired width
              child: ElevatedButton(
                onPressed: () {
                  // Handle Logout
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 91, 89, 247), // Background color of the button
                  onPrimary: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Set border radius
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16, // Set font size
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
