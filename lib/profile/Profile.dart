// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_list_application/homepage/Navigation.dart';
import 'package:todo_list_application/profile/profileWidget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isDarkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: Navigation_menu(),
      body: Column(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.blueAccent,
                        child: Image.network(
                          'https://media.istockphoto.com/id/1145618475/photo/villefranche-on-sea-in-evening.jpg?s=612x612&w=0&k=20&c=vQGj6uK7UUVt0vQhZc9yhRO_oYBEf8IeeDxGyJKbLKI=',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Kim Leones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 17, 17, 17),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'kimleones@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 63, 62, 62),
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
          SizedBox(
            height: 430,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 20, right: 20, bottom: 5),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),

                  //Change Setting Button
                  GestureDetector(
                      onTap: () {
                        // Handle the click event, for example, navigate to the change name screen
                        print('Click Setting');
                      },
                      child: ProfileWidget(
                          title: 'App Settings', icon: Icons.settings)),

                  //Account group
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 20, right: 20, bottom: 5),
                    child: Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 63, 62, 62),
                      ),
                    ),
                  ),

                  //Change Name Button
                  GestureDetector(
                      onTap: () {
                        // Handle the click event, for example, navigate to the change name screen
                        print('Click Name');
                      },
                      child: ProfileWidget(
                          title: 'Change Account Name',
                          icon: Icons.account_circle)),
                  //Change Password
                  GestureDetector(
                      onTap: () {
                        // Handle the click event, for example, navigate to the change password screen
                        print('Click Password');
                      },
                      child: ProfileWidget(
                          title: 'Change Account Password',
                          icon: Icons.key_sharp)),
                  //Change Image
                  GestureDetector(
                      onTap: () {
                        // Handle the click event, for example, navigate to the change image screen
                        print('Click image');
                      },
                      child: ProfileWidget(
                          title: 'Change Account Image',
                          icon: Icons.image_outlined)),
                  //DarkMode Button
                  GestureDetector(
                    onTap: () {
                      // Handle the click event, for example, toggle dark mode
                      setState(() {
                        isDarkModeEnabled = !isDarkModeEnabled;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 63, 62, 62),
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
                  //LOGOUT BUTTON
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Container(
                      height: 50, // Set the desired height
                      width: 335, // Set the desired width
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Logout
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
            ),
          ),
        ],
      ),
    );
  }
}
