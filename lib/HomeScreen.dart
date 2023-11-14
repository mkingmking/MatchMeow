import 'package:flutter/material.dart';
import 'AddPetPage.dart';
import 'PetListPage.dart';
import 'addUserPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Pages to be displayed in the bottom navigation bar
  final List<Widget> _pages = [
    PetListPage(),
    AddPetPage(),
    AddUserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MatchMeow'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pet List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Pet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Add a user icon
            label: 'Add User',
          ),
        ],
      ),
    );
  }
}
