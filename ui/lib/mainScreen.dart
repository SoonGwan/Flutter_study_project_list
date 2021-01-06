import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui/first.dart';
import 'package:ui/home.dart';
import 'package:ui/second.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[First(), Second(), Home()];

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _widgetOptions.elementAt(_selectedIndex)),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.black,
          activeColor: Colors.deepPurple[200],
          splashColor: Colors.deepPurple,
          icons: iconList,
          activeIndex: _selectedIndex,
          inactiveColor: Colors.white,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 22,
          rightCornerRadius: 22,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
