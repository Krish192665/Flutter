import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import 'login_screen.dart'; // 👈 1. Login Page Import કર્યું
import 'supplier_register_screen.dart'; // 👈 2. Supplier Register Page Import કર્યું
//import 'business_register_screen.dart'; // 👈 3. Business Register Page Import કર્યું

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  // ડિફોલ્ટ રીતે ખાલી રહેશે
  String _selectedRole = '';

  // Continue / Submit બટનનું લોજિક
  void _handleContinue() {
    // જો કોઈ રોલ સિલેક્ટ ન કર્યો હોય તો
    if (_selectedRole.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('કૃપા કરીને પહેલા તમારો રોલ (Role) સિલેક્ટ કરો!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // 1. Enterprise Supplier માટે નેવિગેશન
    if (_selectedRole == 'enterprise') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    } 
    // 2. Business માટે નેવિગેશન
    else if (_selectedRole == 'business') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Top Header with Back Button and Centered Title
              Stack(
                alignment: Alignment.center,
                children: [
                  // 1. Back Button (ક્લિક કરતાં Login Page પર જવા માટે)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.accentOrange,
                        size: 22,
                      ),
                      onPressed: () {
                        // 👈 Login Page પર રીડાયરેક્ટ કરવા માટે
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  // 2. Centered Title
                  const Text(
                    'Select Your Role',
                    style: AppTextStyles.roleHeaderTitle,
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Center(
                child: Text(
                  'How do you want to use SubSetu?',
                  style: AppTextStyles.roleSubtitle,
                ),
              ),
              const SizedBox(height: 40),

              // 1. Enterprise Supplier Card
              _buildRoleCard(
                roleKey: 'enterprise',
                title: 'Enterprise Supplier',
                description: 'Register orders & track material workflow',
                icon: Icons.apartment_rounded,
              ),

              const SizedBox(height: 24),

              // 2. Business Card
              _buildRoleCard(
                roleKey: 'business',
                title: 'Business',
                description: 'Accept jobs & upload PoD production sync',
                icon: Icons.corporate_fare_rounded,
              ),

              const Spacer(),

              // Continue / Submit Button
              Center(
                child: SizedBox(
                  width: 220,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _handleContinue,
                    style: AppStyles.primaryButtonStyle,
                    child: const Text(
                      'Continue',
                      style: AppTextStyles.submitButtonText,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Interactive Role Card Widget
  Widget _buildRoleCard({
    required String roleKey,
    required String title,
    required String description,
    required IconData icon,
  }) {
    final bool isSelected = _selectedRole == roleKey;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = roleKey;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        decoration: AppStyles.roleCardDecoration(isSelected: isSelected),
        child: Stack(
          children: [
            // Top-right Check Indicator
            Positioned(
              top: 0,
              right: 0,
              child: isSelected
                  ? Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: AppColors.selectedBorder,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                    )
                  : Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: AppColors.unselectedIndicator,
                        shape: BoxShape.circle,
                      ),
                    ),
            ),

            // Card Content (Icon, Title, Description)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Icon Box
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    icon,
                    size: 58,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                // Role Title
                Text(
                  title,
                  style: AppTextStyles.roleCardTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),

                // Role Description
                Text(
                  description,
                  style: AppTextStyles.roleCardDescription,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}