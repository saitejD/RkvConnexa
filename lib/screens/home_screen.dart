import 'package:RkvConnexa/pages/academics_page.dart';
import 'package:RkvConnexa/pages/home_page.dart';
import 'package:RkvConnexa/pages/profile_page.dart';
import 'package:RkvConnexa/pages/talents_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List _pages = [
    HomePage(),
    AcademicsPage(),
    TalentsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "RkvConnexa",
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        // type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined, color: Colors.black45),
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
              label: "Academics",
              icon: Icon(
                Icons.school_outlined,
                color: Colors.black45,
              ),
              activeIcon: Icon(
                Icons.school,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
              label: "Talents",
              icon: Icon(
                Icons.highlight_outlined,
                color: Colors.black45,
              ),
              activeIcon: Icon(
                Icons.highlight,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person_outline,
              color: Colors.black54,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
