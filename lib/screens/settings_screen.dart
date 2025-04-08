import 'package:flutter/material.dart';
import '../widgets/common_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0, left: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    String? subtitle,
    bool showToggle = false,
    bool toggleValue = false,
    bool showArrow = false,
    String? rightText,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (showToggle)
                Switch(
                  value: toggleValue,
                  onChanged: (value) {},
                  activeColor: Colors.green[700],
                )
              else if (rightText != null)
                Text(
                  rightText,
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 14,
                  ),
                )
              else if (showArrow)
                Icon(Icons.chevron_right, color: Colors.grey[600]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CommonHeader(
        title: 'Cài đặt Samsung Health',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingItem(
              title: 'Đồng bộ với Samsung Cloud',
              showToggle: true,
              toggleValue: false,
            ),
            _buildSectionHeader('Chung'),
            _buildSettingItem(
              title: 'Đơn vị đo',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Thông báo',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Thông báo tiếp thị',
              subtitle: 'Nhận thông báo từ Samsung Health.',
              showToggle: true,
              toggleValue: false,
            ),
            _buildSettingItem(
              title: 'Phụ kiện',
              showArrow: true,
            ),
            _buildSectionHeader('Together'),
            _buildSettingItem(
              title: 'Together',
              subtitle:
                  'Cạnh tranh trong các thử thách số bước và so sánh số bước của bạn với bạn bè và mọi người trên khắp thế giới.',
              showToggle: true,
              toggleValue: false,
            ),
            _buildSectionHeader('Nâng cao'),
            _buildSettingItem(
              title: 'Tự động phát hiện bài tập',
              showToggle: true,
              toggleValue: true,
            ),
            _buildSectionHeader('Dịch vụ và ứng dụng được kết nối'),
            _buildSettingItem(
              title: 'Kết nối sức khỏe',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Ứng dụng',
              subtitle:
                  'Cho phép các chức năng Samsung Health và ứng dụng bên thứ ba đọc và ghi dữ liệu của thể.',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Dịch vụ',
              subtitle:
                  'Đồng bộ dữ liệu Samsung Health với tài khoản web bên thứ ba.',
              showArrow: true,
            ),
            _buildSectionHeader('Riêng tư'),
            _buildSettingItem(
              title: 'Thông báo bảo mật',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Đồng ý với việc xử lý dữ liệu sức khỏe',
              showToggle: true,
              toggleValue: true,
            ),
            _buildSettingItem(
              title: 'Thông tin vị trí',
              showToggle: true,
              toggleValue: false,
            ),
            _buildSettingItem(
              title: 'Quyền',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Dịch vụ tùy chỉnh',
              rightText: 'Bật',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Tải về dữ liệu cá nhân',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Xóa dữ liệu cá nhân',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Rời khỏi Samsung Health',
              showArrow: true,
            ),
            _buildSectionHeader('Thông tin'),
            _buildSettingItem(
              title: 'Thông tin Samsung Health',
              showArrow: true,
            ),
            _buildSettingItem(
              title: 'Liên hệ chúng tôi',
              showArrow: true,
            ),
          ],
        ),
      ),
    );
  }
}
