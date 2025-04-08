import 'package:flutter/material.dart';
import '../widgets/common_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CommonHeader(
        title: 'Trang của bạn',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Card
              Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, 40),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("Trần Đức Duy",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Modify"),
                                    ),
                                  ],
                                )
                              ]),
                        )),
                  ),
                  // Container()
                  Center(
                      // Profile Image
                      child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green[200],
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 60),
              // Badges Section
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
                          'Huy hiệu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Không có huy hiệu',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Huy hiệu Samsung Health đã được cập nhật. ',
                    //       style: TextStyle(
                    //         color: Colors.grey[400],
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //     Text(
                    //       'Xem thêm',
                    //       style: TextStyle(
                    //         color: Colors.blue[300],
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Best Personal Achievement
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
                          'Thành tích cá nhân tốt nhất',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_walk,
                          color: Colors.orange[300],
                          size: 40,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        '25.169',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Bước nhiều nhất',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Weekly Summary
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tổng kết hàng tuần',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ngày 10 - Ngày 16 tháng 3',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSummaryRow('Thời gian h.động TB', '1 phút'),
                    _buildSummaryRow('Nước', '0 ml'),
                    _buildSummaryRow('Huyết áp', '--/-- mmHg'),
                    _buildSummaryRow('Đường huyết', '--- mg/dL'),
                    _buildSummaryRow('Nhịp tim', '-- nhịp/phút'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
