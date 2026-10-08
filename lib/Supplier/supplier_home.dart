import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/supplier_footer.dart';
import 'package:flutter_application_1/Resources/supplier_header.dart';
import 'package:flutter_application_1/Supplier/setting.dart';
import '../App_Style/App_Screen_Style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0; // 0 = Home Tab

  // 👈 બંને કાર્ડ્સનું View More ઓપન/ક્લોઝ રાખવા માટેના States
  bool _isCncExpanded = false;
  bool _isCuttingExpanded = false;

  // 👈 નેવિગેશન બાર પર ક્લિક થતાં હેન્ડલ કરવા માટે
  void _onNavTapped(int index) {
    if (index == 2) {
      // 👈 જો Settings પર ક્લિક કરે તો SettingScreen પર લઈ જશે
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
      backgroundColor: Colors.white,

      // 👈 ૧. Header File Call
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

      // 👈 ૨. Body (CNC & Cutting Technology Cards)
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- કાર્ડ ૧: Best CNC Technology ---
            _buildTechCard(
              imagePath: 'assets/images/i1.jpeg',
              companyName: 'Logo Text Here technology pty.ltd',
              subtitle: 'Best CNC Technology',
              // 👈 કાર્ડ ૧ નો ખાસ મેસેજ (સ્ક્રીનશોટ મુજબ)
              description:
                  'High-precision 5-axis CNC machining, milling, and turning operations with tight tolerances (±0.005mm) for aerospace, automotive, and industrial components.',
              isExpanded: _isCncExpanded,
              onToggle: () {
                setState(() {
                  _isCncExpanded = !_isCncExpanded;
                });
              },
            ),

            const SizedBox(height: 36),

            // --- કાર્ડ ૨: Best Cutting Technology ---
            _buildTechCard(
              imagePath: 'assets/images/i1.jpeg',
              companyName: 'Logo Text Here technology pty.ltd',
              subtitle: 'Best Cutting Technology',
              // 👈 કાર્ડ ૨ નો અલગ મેસેજ
              description:
                  'Advanced industrial laser, plasma, and waterjet cutting solutions offering superior edge quality and high-speed processing for diverse metal sheets.',
              isExpanded: _isCuttingExpanded,
              onToggle: () {
                setState(() {
                  _isCuttingExpanded = !_isCuttingExpanded;
                });
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // 👈 ૩. Footer File Call
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // 👈 સર્ક્યુલર લોગો, ટાઈટલ, એરો અને એક્સપાન્ડેબલ મેસેજ બોક્સ
  Widget _buildTechCard({
    required String imagePath,
    required String companyName,
    required String subtitle,
    required String description,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ૧. સર્ક્યુલર લોગો (ઈમેજ)
          Container(
            width: 155,
            height: 155,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black12,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.primaryNavy,
                    child: const Center(
                      child: Icon(
                        Icons.settings,
                        color: AppColors.accentOrange,
                        size: 60,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 14),

          // ૨. કંપની ટાઈટલ
          Text(
            companyName,
            textAlign: TextAlign.center,
            style: AppTextStyles.homeCardTitle,
          ),

          const SizedBox(height: 4),

          // ૩. સબટાઈટલ
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.homeCardSubtitle,
          ),

          const SizedBox(height: 8),

          // ૪. "View More" ક્લિકેબલ બટન (એરો ઉપર/નીચે થશે)
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'View More',
                    style: AppTextStyles.viewMoreText,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up   // 👈 ઓપન હોય ત્યારે ઉપરનો એરો
                        : Icons.keyboard_arrow_down, // 👈 બંધ હોય ત્યારે નીચેનો એરો
                    color: AppColors.darkText,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),

          // ૫. 👈 સ્મૂથ એનિમેશન સાથે ખુલતું મેસેજ બોક્સ (તમારા સ્ક્રીનશોટ મુજબ)
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity, height: 0),
            secondChild: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 14.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA), // આછો ગ્રે/વ્હાઇટ બેકગ્રાઉન્ડ
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: Color(0xFF374151),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}