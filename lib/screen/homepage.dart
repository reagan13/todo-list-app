// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, sort_child_properties_last

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
    task1(),
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
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('List It Down'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text("Priority Task"),
                ),
                Tab(
                  child: Text("Normal Task"),
                ),
                Tab(
                  child: Text("Least Priority"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 500,
                  width: 370,
                  color: Colors.amber,
                  child: Text('Priority Content'),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 500,
                  width: 370,
                  color: Colors.blueAccent,
                  child: Text('Normal  Content'),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 500,
                  width: 370,
                  color: Colors.red,
                  child: Text('Least Priority Content'),
                ),
              ),
            ],
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
          )),
    );
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
                      'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgIBwcICAgHBwcHBwoHBwcHBw8ICQcKIBEWFhUREx8YHSggGBolJx8VITEhJSkrLi4uFx8zODMsNygtLisBCgoKDQ0NDw0NDysZFRkrLSstNy0rNy0tLSs3KzcrKysrLS03LSsrLSstKzcrKysrKysrKysrKysrKysrKysrK//AABEIALcBEwMBIgACEQEDEQH/xAAZAAEBAQEBAQAAAAAAAAAAAAABAAIDBAf/xAAWEAEBAQAAAAAAAAAAAAAAAAAAARH/xAAYAQEBAQEBAAAAAAAAAAAAAAABAAIDBP/EABYRAQEBAAAAAAAAAAAAAAAAAAARAf/aAAwDAQACEQMRAD8A+MQwRqPfjvhjbMajpjeGNMxpvG8JEabxpEFrC1CyWmsJCJJZJJLJVJQTSaQSJSRSBAQDQo3AzWa2zWNxnWKK1WWNYZrNbrNc9xnWUkyy4xqCGOWOeNwsxp1xvGoRDG8awtMlrGiQmi0giWiyoTWkCSUEiSyTUUCaigiaUElSEhqFBDOhms1qs1jWNZrNaoc9Y1lJMsuMajEajjjnjUaghjrjeNEQttYSE1hJCJJCJJZJJIRNJCRKBKRCRKSKKCNRCSSCDIFZarNZ1nRWK3Wa56xrKSYZcI1GY1HHHPGo1GI1HTGsaILeNFAkkslqkoEkoJFpBGppBEkskqkslGlBElIJFBJEIIVVmmisayzRTWaxrOpBMsvPGozDHnxyxuFmNR0zWsahZhbzWiQiWkES0giSQjUUCSUEiSEUUCajqCVNaTKKpWhJUoIUJmkUaNDNNFc9Z0IJkPPGozDHnxxxoxmNN400WYW80tJk6Wq0gjS0gSigiSWSiUEamkEaqSySSgkigiigkqUFoVQQG6FWaRWNZCCZDzwsxqPNjhhajJjeNNHWS1WmkyWqWkFpNaQRprSCNLSZJqKCRaQRRLJSKCNRQRpKCVRQWihBAJCqi1ndZ3QkGWXnajMLzY440WYY3jTRZJJIRJLJNJLJapJ1laaq0dZRNaQWqmtJnTpqpQ1GlpBKooI1FBCooJVILRo3RVWadZY3Wd1aWUzQ4GMl58cWizKWs1poslulpBEkhGklkpFBGlrUEaitCVTSZOmlrVrKNVa1aNRprWpnUqq0tZWqqtaNGjVVTo1BndZqFVZ1jdFOplCiuRZLhjkYYES0WYWs1ppAtVFBEkslEoI1NJkmkoJIllJVpBGqkspUtJlGppMpVFAaKDo1DRQghazuipDUzQ5oFxcyWS0SdZJLS0atNLSCNLSCNRQRJIRRQSRQSprSCNRQSqKC1VFaNSqOgIUVagBQWdWhndFKCZDCSYZKSJKSKRKJBSSRCJOkIopIlJJIoIopJFJJJJJJIJBDUmakEgACgyEkE//Z'),
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
                  'Kim Leones',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'kimleones@gmail.com',
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
        ),
        ListTile(
          leading: Icon(
            Icons.note_add_sharp,
            size: 25.0,
          ),
          title: Text('Task'),
          selected: _selectedIndex == 1,
          onTap: () {
            // Update the state of the app
            _onItemTapped(1);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.calendar_month,
            size: 25.0,
          ),
          title: Text('Calendar'),
          selected: _selectedIndex == 2,
          onTap: () {
            // Update the state of the app
            _onItemTapped(2);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            size: 25.0,
          ),
          title: Text('Profile'),
          selected: _selectedIndex == 3,
          onTap: () {
            // Update the state of the app
            _onItemTapped(3);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),

        //horizontal line
        Divider(),
        ListTile(
          leading: Icon(
            Icons.exit_to_app_outlined,
            size: 25.0,
          ),
          title: const Text('Exit'),
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
