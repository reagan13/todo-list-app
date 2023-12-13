// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, sort_child_properties_last

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/logout.dart';
import 'package:todo_list_application/screen/completed.dart';
import 'package:todo_list_application/screen/profile.dart';
import 'package:todo_list_application/services/firestoreService.dart';
import 'package:todo_list_application/task/addtask.dart';
import 'package:todo_list_application/screen/calendar.dart';
import 'package:todo_list_application/screen/task.dart';
import 'package:todo_list_application/task/showtask.dart';
import 'package:badges/badges.dart' as badges;
import 'package:todo_list_application/task/no_task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String fname = "";
  String lname = "";

  String firstName = "";
  String lastName = "";
  final user = FirebaseAuth.instance.currentUser!;
  static const List<Widget> _widgetOptions = <Widget>[
    ShowTask(),
    profile(),
    Task(),
    Completed(),
    LogoutPage(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the readTasks method when the widget is initialized
    readTasks().then((_) {
      setState(() {
        // Update the state variable
        firstName = fname;
        lastName = lname;
      });
      print(fname);
      print("It works now");
      print('$firstName yes');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 241, 234, 255),
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text('List It Down'.toUpperCase()),
          )),

          //NOTIFICATION
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: badges.Badge(
                badgeContent: Text(
                  //THE COUNT
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.notifications),
              ),
            )
          ],
        ),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        // Drawer
        drawer: Drawer(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context),
              ],
            ),
          ),
        ));
  }

  // Header widget
  Widget buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/1249864734/photo/beautiful-patagonia-landscape-of-andes-mountain-range-with-high-mountains-with-illuminated.jpg?s=612x612&w=0&k=20&c=i0al5xwBCdxQH2d_TIUkmZse62M-_0CDrFLwLPNW0F0='),
                  fit: BoxFit.cover)),
          child: Container(
            width: 300,
            child: Column(
              children: [
                ClipOval(
                    child: Image.network(
                  'https://media.istockphoto.com/id/1145618475/photo/villefranche-on-sea-in-evening.jpg?s=612x612&w=0&k=20&c=vQGj6uK7UUVt0vQhZc9yhRO_oYBEf8IeeDxGyJKbLKI=',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                )),
                Text(
                  '$firstName $lastName',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  user.email!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

//s
  // Navigation items widget
  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.home,
            size: 25.0,
          ),
          title: Text('Home'),
          selected: _selectedIndex == 0,
          onTap: () {
            // Update the state of the app
            _onItemTapped(0);
            // Then close the drawer
            Navigator.pop(context);
          },
          selectedColor: Color.fromARGB(255, 178, 164, 255),
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            size: 25.0,
          ),
          title: Text('Profile'),
          selected: _selectedIndex == 1,
          onTap: () {
            // Update the state of the app
            _onItemTapped(1);
            // Then close the drawer
            Navigator.pop(context);
          },
          selectedColor: Color.fromARGB(255, 178, 164, 255),
        ),
        ListTile(
          leading: Icon(
            Icons.note_add_sharp,
            size: 25.0,
          ),
          title: Text('Task'),
          selected: _selectedIndex == 2,
          onTap: () {
            // Update the state of the app
            _onItemTapped(2);
            // Then close the drawer
            Navigator.pop(context);
          },
          selectedColor: Color.fromARGB(255, 178, 164, 255),
        ),
        ListTile(
          leading: Icon(
            Icons.note_add_sharp,
            size: 25.0,
          ),
          title: Text('Complete Task'),
          selected: _selectedIndex == 3,
          onTap: () {
            // Update the state of the app
            _onItemTapped(3);
            // Then close the drawer
            Navigator.pop(context);
          },
          selectedColor: Color.fromARGB(255, 178, 164, 255),
        ),

        //horizontal line
        Divider(),
        ListTile(
          leading: Icon(
            Icons.logout_rounded,
            size: 25.0,
          ),
          title: const Text('Logout'),
          selected: _selectedIndex == 4,
          onTap: () {
            _onItemTapped(4);
            FirebaseAuth.instance.signOut();
          },
          selectedColor: Color.fromARGB(255, 178, 164, 255),
        ),
      ],
    );
  }

  // Read
  Future<void> readTasks() async {
    await FirestoreService()
        .firestoreService
        .collection("users")
        .where("email", isEqualTo: user.email!)
        .get()
        .then(
      (querySnapshot) {
        print("Successfully completed");

        for (var docSnapshot in querySnapshot.docs) {
          // Retrieve the name from the document data
          fname = docSnapshot.data()['First Name'];
          lname = docSnapshot.data()['Last Name'];
        }
        print(fname);
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
