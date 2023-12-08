// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_application/authentication/logout.dart';
import 'package:todo_list_application/screen/profile.dart';
import 'package:todo_list_application/task/addtask.dart';
import 'package:todo_list_application/screen/calendar.dart';
import 'package:todo_list_application/screen/task.dart';
import 'package:todo_list_application/task/showtask.dart';
import 'package:todo_list_application/task/task1.dart';

import 'package:todo_list_application/task/no_task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static const List<Widget> _widgetOptions = <Widget>[
    ShowTask(),
    NoTask(),
    profile(),
    LogoutPage()
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List It Dow'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),

        // Drawer
        drawer: Drawer(
          child: SingleChildScrollView(
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
      children: [Text('Header')],
    );
  }

  // Navigation items widget
  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.home_max_outlined),
          title: Text('Home'),
          selected: _selectedIndex == 0,
          onTap: () {
            // Update the state of the app
            _onItemTapped(0);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.home_max_outlined),
          title: Text('Home'),
          selected: _selectedIndex == 1,
          onTap: () {
            // Update the state of the app
            _onItemTapped(1);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.home_max_outlined),
          title: Text('Home'),
          selected: _selectedIndex == 2,
          onTap: () {
            // Update the state of the app
            _onItemTapped(2);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.home_max_outlined),
          title: Text('Home'),
          selected: _selectedIndex == 3,
          onTap: () {
            // Update the state of the app
            _onItemTapped(3);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
