import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/business_header.dart'; // 👈 Business Header
import 'package:flutter_application_1/Resources/business_footer.dart'; // 👈 Business Footer
import '../App_Style/App_Screen_Style.dart';
import 'business_setting.dart'; // 👈 તમારી Setting ફાઈલનું નામ

class BusinessHomeScreen extends StatefulWidget {
  const BusinessHomeScreen({super.key});

  @override
  State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  int _currentNavIndex = 0; // 0 = Home Tab Active

  // 👈 નેવિગેશન બાર ટેબ ક્લિક હેન્ડલર
  void _onNavTapped(int index) {
    if (index == 2) {
      // Settings પેજ પર જશે
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else {
      setState(() {
        _currentNavIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 ૧. Business Header (Business Home Title & Menu)
      appBar: BusinessHeader(
        onProfileTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Business Profile Clicked')),
          );
        },
        onMenuTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Menu Clicked')),
          );
        },
      ),

      // 👈 ૨. Body (Total Job: 24, Pending: 10, Job Inbox)
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle
            const Text(
              'manage your cutting jobs',
              style: AppTextStyles.subheaderGray,
            ),

            const SizedBox(height: 18),

            // 👈 2x2 Stats Summary Grid (તમારા બિઝનેસ સ્ક્રીનશોટ મુજબ)
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'Total Job',
                    value: '24',
                    valueColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildStatCard(
                    title: 'Pending (Padding)',
                    value: '10',
                    valueColor: AppColors.accentOrange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'In Progress',
                    value: '08',
                    valueColor: AppColors.statusBlue,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildStatCard(
                    title: 'Ready',
                    value: '06',
                    valueColor: AppColors.statusGreen,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // 👈 Section Header: "Job Inbox (New Cards)"
            const Text(
              'Job Inbox (New Cards)',
              style: AppTextStyles.sectionTitle,
            ),

            const SizedBox(height: 16),

            // 👈 Order 1 Card
            _buildOrderCard(
              orderTitle: 'Order #1 - Tech Corp Inc.',
              orderDate: 'Date: 18 Feb 2026',
            ),

            const SizedBox(height: 14),

            // 👈 Order 2 Card
            _buildOrderCard(
              orderTitle: 'Order #2 - Alpha Ind.',
              orderDate: 'Date: 17 Feb 2026',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // 👈 ૩. Business Footer (Home, Orders, Settings, Notification)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // Stats Card Widget
  Widget _buildStatCard({
    required String title,
    required String value,
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.statCardLabel,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  // Job Inbox Order Card Widget
  Widget _buildOrderCard({
    required String orderTitle,
    required String orderDate,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderTitle,
            style: AppTextStyles.orderCardTitle,
          ),
          const SizedBox(height: 6),
          Text(
            orderDate,
            style: AppTextStyles.orderCardDate,
          ),
        ],
      ),
    );
  }
}