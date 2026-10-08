import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/supplier_footer.dart'; // 👈 Footer Import
import 'package:flutter_application_1/Resources/supplier_header.dart'; // 👈 Header Import
import '../App_Style/App_Screen_Style.dart';
import 'supplier_help&support_screen.dart';
import 'supplier_about_us.dart';
import 'supplier_contact_us.dart';
import '../Screen/login_screen.dart';
import 'supplier_change_password_screen.dart';
import "./supplier_home.dart"; // 👈 Home Page Import કર્યું (જ્યાં રીડાયરેક્ટ થવું છે)

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Footer માં Settings ટેબ (Index: 2) પસંદ કરેલું રહેશે
  final int _currentNavIndex = 2;

  // 👈 Footer Navigation હેન્ડલર
  void _onNavTapped(int index) {
    if (index == 0) {
      // 👈 Home ટેબ પર ક્લિક કરતાં Home Screen પર જશે
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index != 2) {
      // અન્ય ટેબ્સ માટે મેસેજ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            index == 1 ? 'Current Order Clicked' : 'Notification Clicked',
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  // Logout Confirmation Popup Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.cardNavy,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.white12),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to logout from your account?',
            style: TextStyle(color: AppColors.subtitleGray),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.pop(dialogContext); // Dialog બંધ કરવા
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 ૧. Supplier Header કૉલ કર્યો
      appBar: CustomHeader(
        onProfileTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile Clicked')),
          );
        },
        onMenuTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Menu Clicked')),
          );
        },
      ),

      // 👈 ૨. Body (Settings Options)
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Header / App Bar (Centered Title with Back Button)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.accentOrange,
                          size: 20,
                        ),
                        // 👈 ૨. Back Button દબાવતાં સીધું Home Page પર રીડાયરેક્ટ થશે
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 1. Help & Support
              _SettingsTile(
                icon: Icons.help_outline_rounded,
                title: 'Help & Support',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpSupportScreen(),
                    ),
                  );
                },
              ),

              // 2. About Us
              _SettingsTile(
                icon: Icons.info_outline_rounded,
                title: 'About Us',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsScreen(),
                    ),
                  );
                },
              ),

              // 3. Contact Us
              _SettingsTile(
                customIcon: const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.person_outline_rounded, color: Colors.white, size: 26),
                    Positioned(
                      right: -4,
                      top: 0,
                      child: Text(
                        '?',
                        style: TextStyle(
                          color: AppColors.accentOrange,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                title: 'Contact Us',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUsScreen(),
                    ),
                  );
                },
              ),

              // 4. Change Password
              _SettingsTile(
                icon: Icons.lock_reset_rounded,
                title: 'Change Password',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen(),
                    ),
                  );
                },
              ),

              // 5. Logout
              _SettingsTile(
                icon: Icons.logout_rounded,
                title: 'Logout',
                onTap: () => _showLogoutDialog(context),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // 👈 ૩. Supplier Footer કૉલ કર્યો (Settings ટેબ સિલેક્ટેડ રહેશે)
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex, // 2 = Settings Icon Highlighted
        onItemTapped: _onNavTapped,
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData? icon;
  final Widget? customIcon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    this.icon,
    this.customIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: customIcon ??
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 26,
                    ),
              ),
            ),
            const SizedBox(width: 24),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white24,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}