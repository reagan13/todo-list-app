// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_field, camel_case_types, non_constant_identifier_names, use_function_type_syntax_for_parameters

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final user = FirebaseAuth.instance.currentUser!;
  int _currentIndex = 0;
  bool isDarkModeEnabled =
      false; // This is the state that will control the Switch

// initialize text controller

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  //TextField WIDGET
  Widget editNamesWidget(
      {required textEditingController, required keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        controller: textEditingController,
        // focusNode: _emailFocusNode,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          // decoration box

          filled: true,
          fillColor: const Color.fromARGB(255, 241, 244, 248),

          suffixIcon: IconButton(
              onPressed: () {
                textEditingController.clear();
              },
              icon: const Icon(Icons.clear)),
        ),
        keyboardType: keyboardType,
      ),
    );
  }

// ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blueAccent,
                      child: Image.network(
                        'https://media.istockphoto.com/id/1145618475/photo/villefranche-on-sea-in-evening.jpg?s=612x612&w=0&k=20&c=vQGj6uK7UUVt0vQhZc9yhRO_oYBEf8IeeDxGyJKbLKI=',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Kim Leones',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 17, 17, 17),
                    ),
                  ),
                ),
                //DISPLAY EMAAIL
                Text(
                  user.email!,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 63, 62, 62),
                    ),
                  ),
                ),

                //DarkMode Text
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 24, top: 5, right: 20, bottom: 5),
                //   child: Text(
                //     'Dark Mode',
                //     style: TextStyle(
                //       fontSize: 12,
                //       fontWeight: FontWeight.w600,
                //       color: const Color.fromARGB(255, 63, 62, 62),
                //     ),
                //   ),
                // ),
                // //DarkMode Button
                // GestureDetector(
                //   onTap: () {
                //     // Handle the click event, for example, toggle dark mode
                //     setState(() {
                //       isDarkModeEnabled = !isDarkModeEnabled;
                //     });
                //   },
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.only(left: 20, right: 20, top: 10),
                //     child: Container(
                //       height: 70,
                //       width: 335,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(14),
                //       ),
                //       child: Row(
                //         children: [
                //           Container(
                //             child: Padding(
                //               padding: const EdgeInsets.all(10.0),
                //               child: Icon(
                //                 Icons.dark_mode,
                //                 color: const Color.fromARGB(255, 63, 62, 62),
                //                 size: 24,
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: SwitchListTile(
                //               title: Text(
                //                 'Dark Mode',
                //                 style: TextStyle(
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w500,
                //                   color: const Color.fromARGB(255, 63, 62, 62),
                //                 ),
                //               ),
                //               value: isDarkModeEnabled,
                //               onChanged: (bool value) {
                //                 setState(() {
                //                   isDarkModeEnabled = value;
                //                 });
                //                 // Add logic to handle the switch state change, for example, toggle dark mode
                //               },
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  height: 1, // Set the height of the divider
                  color: Colors.grey, // Set the color of the divider
                  margin: EdgeInsets.symmetric(
                      vertical: 10), // Set margin if needed
                ),
              ],
            ),
          ),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Account group
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 20, right: 20, bottom: 5),
                    child: Text(
                      'Edit Account Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),

                  //Change First Name
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 20,
                      right: 20,
                    ),
                    child: Text(
                      'Edit First Name ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),
                  editNamesWidget(
                    textEditingController: _lnameController,
                    keyboardType: TextInputType.text,
                  ),

                  //Change Last Name
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 10,
                      right: 20,
                    ),
                    child: Text(
                      'Edit Last Name ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),
                  editNamesWidget(
                    textEditingController: _lnameController,
                    keyboardType: TextInputType.text,
                  ),
                  //Change Email Button
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 10,
                      right: 20,
                    ),
                    child: Text(
                      'Edit Email ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),
                  editNamesWidget(
                    textEditingController: _lnameController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  //Change Password
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 10,
                      right: 20,
                    ),
                    child: Text(
                      'Edit Password ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),
                  editNamesWidget(
                    textEditingController: _lnameController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40, // Set the desired height

                  child: ElevatedButton(
                    onPressed: () {
                      //handle Cancel the editting
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Background color of the button
                      onPrimary:
                          Color.fromARGB(255, 178, 164, 255), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set border radius
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16, // Set font size
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40, // Set the desired height

                  child: ElevatedButton(
                    onPressed: () {
                      //handle  the editting
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 178, 164, 255), // Background color of the button
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set border radius
                      ),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 16, // Set font size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 241, 234, 255),
    );
  }
}
