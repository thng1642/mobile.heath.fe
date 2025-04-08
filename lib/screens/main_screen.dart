import 'package:flutter/material.dart';
import 'health_tracking_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HealthTrackingScreen(),
    const Scaffold(
      body: Center(child: Text('Together Screen')),
    ),
    const Scaffold(
      body: Center(child: Text('Exercise Screen')),
    ),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Màn hình chờ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Together',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Thể dục',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Trang của bạn',
          ),
        ],
      ),
    );
  }
}
