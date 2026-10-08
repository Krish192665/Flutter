import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';

class BusinessHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onMenuTap;

  const BusinessHeader({
    super.key,
    this.onProfileTap,
    this.onMenuTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 👈 ફૂટર જેવો જ સેમ ડાર્ક નેવી કલર
      color: AppColors.primaryNavy,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 65.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // 👈 ૧. લેફ્ટ પ્રોફાઇલ આઈકોન (યેલો/ગોલ્ડ આઉટલાઇન)
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
                      size: 22,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              // 👈 ૨. ટાઈટલ: "Business Home"
              const Expanded(
                child: Text(
                  'Business Home',
                  style: AppTextStyles.businessHeaderTitle,
                ),
              ),

              // 👈 ૩. રાઇટ હેમ્બર્ગર મેનુ આઈકોન
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