import 'package:flutter/material.dart';
import 'package:todo_list_application/screen/calendar.dart';
import 'package:todo_list_application/screen/homepage.dart';
import 'package:todo_list_application/screen/profile.dart';
import 'package:todo_list_application/screen/task.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int index = 0; // index sa pages/screens
  final screens = [
    const Homepage(),
    const allTask(),
    const calendar(),
    const profile()
  ]; // different pages for routing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
          height: 60,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: NavigationBar(
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                selectedIndex: index,
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                destinations: const [
                  NavigationDestination(
                    icon: Icon(
                      Icons.home,
                      size: 25.0,
                    ),
                    selectedIcon: Icon(Icons.home_filled),
                    tooltip: 'App home',
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.note_add_sharp,
                      size: 25.0,
                    ),
                    tooltip: 'Tasks',
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.calendar_month,
                      size: 25.0,
                    ),
                    tooltip: 'Calendar',
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.person,
                      size: 25.0,
                    ),
                    tooltip: 'Profile',
                    label: '',
                  ),
                ]),
          )),
    );
  }
}
