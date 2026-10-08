import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';

class CustomFooter extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomFooter({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryNavy,
        border: Border(
          top: BorderSide(color: Colors.white12, width: 0.5),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 1. Home
            _buildNavItem(
              index: 0,
              icon: Icons.home,
              label: 'Home',
            ),

            // 2. Current Order
            _buildNavItem(
              index: 1,
              icon: Icons.chat_bubble_outline_rounded,
              label: 'Current Order',
            ),

            // 3. Settings
            _buildNavItem(
              index: 2,
              icon: Icons.settings_outlined,
              label: 'Settings',
            ),

            // 4. Notification
            _buildNavItem(
              index: 3,
              icon: Icons.notifications_none_outlined,
              label: 'Notification',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = selectedIndex == index;
    final Color itemColor = isSelected ? AppColors.accentOrange : AppColors.footerInactive;

    return InkWell(
      onTap: () => onItemTapped(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: itemColor,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.navLabel.copyWith(
                color: itemColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}