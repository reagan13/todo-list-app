// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors, unused_import, camel_case_types, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:todo_list_application/homepage/homepage.dart';
import 'package:todo_list_application/profile/profile.dart';

import 'package:todo_list_application/task/task1.dart';

import '../screen/calendar.dart';

class Navigation_menu extends StatefulWidget {
  const Navigation_menu({
    super.key,
  });

  @override
  State<Navigation_menu> createState() => _Navigation_menuState();
}

class _Navigation_menuState extends State<Navigation_menu> {
  bool _isSelected = false;
  int _selectedIndex = 0;

  //update selected item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("Widget tree is being rebuilt with selectedIndex: $_selectedIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Kim Leones'),
              accountEmail: Text('kimleones@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: Image.network(
                  'https://media.istockphoto.com/id/1145618475/photo/villefranche-on-sea-in-evening.jpg?s=612x612&w=0&k=20&c=vQGj6uK7UUVt0vQhZc9yhRO_oYBEf8IeeDxGyJKbLKI=',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                )),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgIBwcICAgHBwcHBwoHBwcHBw8ICQcKIBEWFhUREx8YHSggGBolJx8VITEhJSkrLi4uFx8zODMsNygtLisBCgoKDQ0NDw0NDysZFRkrLSstNy0rNy0tLSs3KzcrKysrLS03LSsrLSstKzcrKysrKysrKysrKysrKysrKysrK//AABEIALcBEwMBIgACEQEDEQH/xAAZAAEBAQEBAQAAAAAAAAAAAAABAAIDBAf/xAAWEAEBAQAAAAAAAAAAAAAAAAAAARH/xAAYAQEBAQEBAAAAAAAAAAAAAAABAAIDBP/EABYRAQEBAAAAAAAAAAAAAAAAAAARAf/aAAwDAQACEQMRAD8A+MQwRqPfjvhjbMajpjeGNMxpvG8JEabxpEFrC1CyWmsJCJJZJJLJVJQTSaQSJSRSBAQDQo3AzWa2zWNxnWKK1WWNYZrNbrNc9xnWUkyy4xqCGOWOeNwsxp1xvGoRDG8awtMlrGiQmi0giWiyoTWkCSUEiSyTUUCaigiaUElSEhqFBDOhms1qs1jWNZrNaoc9Y1lJMsuMajEajjjnjUaghjrjeNEQttYSE1hJCJJCJJZJJIRNJCRKBKRCRKSKKCNRCSSCDIFZarNZ1nRWK3Wa56xrKSYZcI1GY1HHHPGo1GI1HTGsaILeNFAkkslqkoEkoJFpBGppBEkskqkslGlBElIJFBJEIIVVmmisayzRTWaxrOpBMsvPGozDHnxyxuFmNR0zWsahZhbzWiQiWkES0giSQjUUCSUEiSEUUCajqCVNaTKKpWhJUoIUJmkUaNDNNFc9Z0IJkPPGozDHnxxxoxmNN400WYW80tJk6Wq0gjS0gSigiSWSiUEamkEaqSySSgkigiigkqUFoVQQG6FWaRWNZCCZDzwsxqPNjhhajJjeNNHWS1WmkyWqWkFpNaQRprSCNLSZJqKCRaQRRLJSKCNRQRpKCVRQWihBAJCqi1ndZ3QkGWXnajMLzY440WYY3jTRZJJIRJLJNJLJapJ1laaq0dZRNaQWqmtJnTpqpQ1GlpBKooI1FBCooJVILRo3RVWadZY3Wd1aWUzQ4GMl58cWizKWs1poslulpBEkhGklkpFBGlrUEaitCVTSZOmlrVrKNVa1aNRprWpnUqq0tZWqqtaNGjVVTo1BndZqFVZ1jdFOplCiuRZLhjkYYES0WYWs1ppAtVFBEkslEoI1NJkmkoJIllJVpBGqkspUtJlGppMpVFAaKDo1DRQghazuipDUzQ5oFxcyWS0SdZJLS0atNLSCNLSCNRQRJIRRQSRQSprSCNRQSqKC1VFaNSqOgIUVagBQWdWhndFKCZDCSYZKSJKSKRKJBSSRCJOkIopIlJJIoIopJFJJJJJJIJBDUmakEgACgyEkE//Z'),
                      fit: BoxFit.fill)),
            ),

            //Notification
            ListTile(
              leading: Icon(
                Icons.notifications_active,
                size: 25.0,
              ),
              title: const Text('Notification'),

              onTap: () {
                setState(() {
                  //Handle Notification
                });
              },
              selectedTileColor: Colors.grey[200], // Set your preferred color
            ),
            //horizontal line
            Divider(),
            //Homepage
            ListTile(
              leading: Icon(
                Icons.home,
                size: 25.0,
              ),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                print("Tapped on Home");
                setState(() {
                  //Handle homepage route
                  _selectedIndex = 0;
                  _onItemTapped(0);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                });
              },
              selectedTileColor: Colors.grey[200], // Set your preferred color
            ),
            //TaskPage
            ListTile(
              leading: Icon(
                Icons.note_add_sharp,
                size: 25.0,
              ),
              title: const Text('Task'),
              selected: _selectedIndex == 1,
              onTap: () {
                print("Tapped on task1");
                setState(() {
                  //Handle task route
                  _selectedIndex = 1;
                  _onItemTapped(1);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => task1()));
                });
              },
              selectedTileColor: Colors.grey[200],
            ),
            //CalendarPage
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                size: 25.0,
              ),
              title: const Text('Calendar'),
              selected: _selectedIndex == 2,
              onTap: () {
                print("Tapped on calendar");
                setState(() {
                  //Handle calendar route
                  _selectedIndex = 2;
                  _onItemTapped(2);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => calendar()));
                });
              },
              selectedTileColor: Colors.grey[200],
            ),
            //ProfilePage
            ListTile(
              leading: Icon(
                Icons.person,
                size: 25.0,
              ),
              title: const Text('Profile'),
              selected: _selectedIndex == 3,
              onTap: () {
                print("Tapped on Profile");
                //Handle profile route
                setState(() {
                  _onItemTapped(3);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                });
              },
              selectedTileColor: Colors.grey[200],
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
              selectedTileColor: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}
