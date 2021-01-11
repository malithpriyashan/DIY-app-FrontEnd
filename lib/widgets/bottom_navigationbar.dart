import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationBar1 extends StatefulWidget {
  @override
  _BottomNavigationBar1State createState() => _BottomNavigationBar1State();
}

class _BottomNavigationBar1State extends State<BottomNavigationBar1> {
  int selectedPage = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Guide',
      style: optionStyle,
    ),
    Text(
      'Index 2: Shop',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.pencilBoxOutline),
          activeIcon: Icon(MdiIcons.pencilBox),
          label: 'Guide',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop_outlined),
          activeIcon: Icon(Icons.shop),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          //icon: Icon(Icons.account_circle_outlined),
          icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/Images/halsey1.jpg')),
          //activeIcon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedPage,
      selectedItemColor: Colors.purpleAccent,
      onTap: onItemTapped,
    );
  }
}
