import 'package:flutter/material.dart';
import 'AddPetPage.dart';
import 'PetListPage.dart';
import 'addUserPage.dart';
import 'UserListPage.dart';

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
    UserListPage(), // Add the UserListPage here
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

        backgroundColor: Colors.red, // Set the background color to red
        selectedItemColor: const Color.fromARGB(
            255, 122, 31, 31), // Optional: Set the selected item color
        unselectedItemColor: const Color.fromARGB(
            179, 118, 15, 15), // Optional: Set the unselected item
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
            icon: Icon(Icons.person),
            label: 'Add User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list), // Icon for user list
            label: 'User List',
          ),
        ],
      ),
    );
  }
}
