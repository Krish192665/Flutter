import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onMenuTap;

  const CustomHeader({
    super.key,
    this.onProfileTap,
    this.onMenuTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryNavy,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 60.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 👈 1. Left Profile / Avatar Icon (Gold/Orange)
              GestureDetector(
                onTap: onProfileTap ?? () {},
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.accentOrange,
                      width: 2.2,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: AppColors.accentOrange,
                      size: 24,
                    ),
                  ),
                ),
              ),

              // 👈 2. Right Hamburger Menu Icon
              IconButton(
                onPressed: onMenuTap ?? () {},
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.accentOrange,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}