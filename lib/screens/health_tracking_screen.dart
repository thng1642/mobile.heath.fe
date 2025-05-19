import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import 'exercise_types_screen.dart';
import 'package:healthycare/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HealthTrackingScreen extends StatefulWidget {
  const HealthTrackingScreen({Key? key}) : super(key: key);

  @override
  State<HealthTrackingScreen> createState() => _HealthTrackingScreenState();
}

class _HealthTrackingScreenState extends State<HealthTrackingScreen> {
  final SocketService _socketService = SocketService();
  int _heartRate = 70;
  Timer? _timer;
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  void initState() {
    super.initState();
    _initializeSocket();
    _startSimulatingHeartRate();
  }

  @override
  void dispose() {
    super.dispose();
    _socketService.disconnect();
  }

  void _initializeSocket() {
    _socketService.connect();

    // Listen for real-time updates
    _socketService.on('connection', (data) {
      // Handle health data updates
      print('Received health update: $data');
      // You can update the UI here based on the received data
    });
  }

  void _startSimulatingHeartRate() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Simulate heart rate changes (you can make this more sophisticated)
      final random = Random();
      final change = random.nextInt(5) - 2; // Random change between -2 and 2
      _heartRate = (_heartRate + change)
          .clamp(40, 180); // Keep within a reasonable range
      _socketService.emit("event", _heartRate);
      print('Heart rate: $_heartRate bpm');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CommonHeader(
        title: 'App Health',
        additionalActions: [
          IconButton(
            icon: const Icon(Icons.star_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Steps Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '772',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            '12%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '/6.000 bước',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.12,
                      backgroundColor: Colors.grey[800],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.green[700]!,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Activity Types
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActivityButton(
                      context, Icons.directions_run, 'Chạy bộ', false),
                  _buildActivityButton(
                      context, Icons.directions_walk, 'Đi bộ', false),
                  _buildActivityButton(
                      context, Icons.directions_bike, 'Đạp xe', false),
                  _buildActivityButton(
                      context, Icons.more_horiz, 'Nhiều hơn', true),
                ],
              ),
              const SizedBox(height: 20),
              // Training Log Button
              _buildMenuButton(Icons.timer, 'Nhật ký tập luyện'),
              const SizedBox(height: 20),
              // Food Tracking
              _buildTrackingCard('Thức ăn', 0.7),
              const SizedBox(height: 20),
              // Body Composition
              _buildTrackingCard('Thành phần cơ thể', 0.4),
              const SizedBox(height: 20),
              // Water Tracking
              _buildTrackingCard('Nước', 0.0),
              const SizedBox(height: 20),
              // Blood Pressure
              _buildTrackingCard('Huyết áp', 0.0),
              const SizedBox(height: 20),
              // Blood Sugar
              _buildTrackingCard('Đường huyết', 0.0),
              const SizedBox(height: 20),
              // Heart Rate
              _buildTrackingCard('Nhịp tim', 0.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Màn hình chờ',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Together'),
          BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Thể dục'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Trang của bạn',
          ),
        ],
      ),
    );
  }

  Widget _buildActivityButton(
      BuildContext context, IconData icon, String label, bool isMore) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (isMore) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExerciseTypesScreen(),
                  ),
                );
              }
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildMenuButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingCard(String title, double progress) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    _getIconForTitle(title),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Nhập',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[800],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green[700]!),
          ),
        ],
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title) {
      case 'Thức ăn':
        return Icons.restaurant;
      case 'Thành phần cơ thể':
        return Icons.person_outline;
      case 'Nước':
        return Icons.water_drop;
      case 'Huyết áp':
        return Icons.favorite;
      case 'Đường huyết':
        return Icons.bloodtype;
      case 'Nhịp tim':
        return Icons.monitor_heart;
      default:
        return Icons.circle;
    }
  }
}
