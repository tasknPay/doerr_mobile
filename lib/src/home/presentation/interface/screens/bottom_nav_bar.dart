import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../messages/presentation/interface/screens/messages_screen.dart';
import '../../../../profile/presentation/interface/screens/profile_screen.dart';
import '../../../../tasks/presentation/interface/screens/add_task_screen.dart';
import 'home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // List of screens to be displayed
  final List<Widget> _screens = const [
    HomeScreen(),
    MessagesScreen(),
    AddTaskScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // Using IndexedStack to preserve state
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(IconlyBold.home)
                : const Icon(IconlyLight.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(IconlyBold.chat)
                : const Icon(IconlyLight.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(IconlyBold.plus)
                : const Icon(IconlyLight.plus),
            label: 'Add Task',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(IconlyBold.profile)
                : const Icon(IconlyLight.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
