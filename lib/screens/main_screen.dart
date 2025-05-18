import 'package:flutter/material.dart';
import 'package:healthycare/screens/health_tracking_screen.dart';
import 'package:healthycare/screens/profile_screen.dart';
import 'package:healthycare/screens/settings_screen.dart';
import 'package:healthycare/services/socket_service.dart';
import 'package:logger/logger.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  final SocketService _socketService = SocketService();

  @override
  void initState() {
    super.initState();
    logger.d('Initializing socket...');
    _initializeSocket();
  }

  void _initializeSocket() {
    _socketService.connect();

    _socketService.on('connection', (data) {
      logger.d('Received connection update: $data');
    });

    _socketService.on('exerciseUpdate', (data) {
      logger.d('Received exercise update: $data');
    });
    _socketService.emit("connection", "text");
  }

  @override
  void dispose() {
    _socketService.disconnect();
    super.dispose();
  }

  final List<Widget> _screens = [
    const HealthTrackingScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Sức khỏe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
