import 'package:assignment_app/Pages/demo.dart';
import 'package:assignment_app/Screens/contribute.dart';
import 'package:assignment_app/Screens/explore.dart';
import 'package:assignment_app/Screens/profile.dart';
import 'package:assignment_app/Screens/rewards.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    demo(),
    explore(),
    contribute(),
    rewards(),
    profile(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: "Contribute",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            label: "Rewards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
