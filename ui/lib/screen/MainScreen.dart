import 'package:flutter/material.dart';
import 'package:ui/components/KlassMain.dart';
import 'package:ui/components/Myprofile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[KlassMainPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_collection_outlined,
                    color: Colors.grey,
                    size: 36,
                  ),
                  title: Text('수강'),
                  activeIcon: Icon(
                    Icons.video_collection_outlined,
                    size: 36,
                    color: Colors.orange[400],
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people_alt_outlined,
                    color: Colors.grey,
                    size: 36,
                  ),
                  title: Text('마이페이지', style: TextStyle(fontSize: 16)),
                  activeIcon: Icon(Icons.people_alt_outlined,
                      size: 36, color: Colors.orange[400])),
            ],
            fixedColor: Colors.orange[400],
            selectedFontSize: 16,
            unselectedFontSize: 16,
            onTap: (index) => {
                  setState(() => {_selectedIndex = index})
                }),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
