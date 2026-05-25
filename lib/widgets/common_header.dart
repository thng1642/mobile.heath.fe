import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? additionalActions;
  final bool showBackButton;

  const CommonHeader({
    super.key,
    required this.title,
    this.additionalActions,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (additionalActions != null) ...additionalActions!,
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          color: Colors.grey[900],
          position: PopupMenuPosition.under,
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'settings',
              child: Row(
                children: [
                  Icon(Icons.settings, color: Colors.grey[400], size: 20),
                  const SizedBox(width: 12),
                  const Text(
                    'Cài đặt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'notifications',
              child: Row(
                children: [
                  Icon(Icons.notifications, color: Colors.grey[400], size: 20),
                  const SizedBox(width: 12),
                  const Text(
                    'Thông báo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onSelected: (String value) {
            if (value == 'settings' && !showBackButton) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            } else if (value == 'notifications') {
              // Handle notifications
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
