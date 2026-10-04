import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import 'forgot_password_screen.dart'; // Forgot Password પેજ સાથે કનેક્ટ
import 'role_screen.dart';            // Sign Up ક્લિક કરતાં Role Screen પર જવા માટે

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logging in successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // લૉગિન થયા પછી Role Screen પર જવા માટે
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectRoleScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // 1. SubSetu Circular Logo (assets/images/i1.jpeg)
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/i1.jpeg',
                        fit: BoxFit.cover,
                        // જો ઈમેજ ન મળે તો ફોલબેક આઇકોન દેખાશે
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.cardNavy,
                            child: const Icon(
                              Icons.hub_rounded,
                              size: 60,
                              color: AppColors.accentOrange,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 2. Title: "Login to Account"
                  const Text(
                    'Login to Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // 3. Email Input Field (Split Box: Grey Icon + Orange Input)
                  _buildSplitInputField(
                    label: 'Email',
                    controller: _emailController,
                    hintText: 'Enter your Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // 4. Password Input Field (Split Box: Grey Icon + Orange Input)
                  _buildSplitInputField(
                    label: 'Password',
                    controller: _passwordController,
                    hintText: 'Enter your Password',
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  // 5. "Forgot password?" Link (જમણી બાજુ Aligned)
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // Forgot Password પેજ પર જવા માટે
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: AppColors.accentOrange,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 38),

                  // 6. Login Button (ઓરેન્જ Pill બટન)
                  SizedBox(
                    width: 170,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: AppStyles.primaryButtonStyle,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

                  // 7. Footer: Need an Account ? Sign Up
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Need an Account ? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            // Role Screen પર જવા માટે
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectRoleScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColors.accentOrange,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🌟 ઇમેજ મુજબનું Dual-tone Input Field (ડાબી બાજુ ગ્રે આઇકોન + જમણી બાજુ ઓરેન્જ ઇનપુટ)
  Widget _buildSplitInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return FormField<String>(
      validator: validator != null ? (_) => validator(controller.text) : null,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Field Label (White)
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            // Dual-tone Rounded Pill Box
            Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
              ),
              clipBehavior: Clip.antiAlias, // ખૂણાઓને રાઉન્ડ કટ કરવા માટે
              child: Row(
                children: [
                  // ડાબી બાજુનું ગ્રે આઇકોન કન્ટેનર
                  Container(
                    width: 52,
                    height: double.infinity,
                    color: const Color(0xFFD9DDE2), // સિલ્વર-ગ્રે કલર
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      color: Colors.black87,
                      size: 22,
                    ),
                  ),

                  // જમણી બાજુનું ઓરેન્જ ટેક્સ્ટફિલ્ડ કન્ટેનર
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      color: AppColors.accentOrange,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: controller,
                        obscureText: obscureText,
                        keyboardType: keyboardType,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: Colors.black,
                        onChanged: (text) => state.didChange(text),
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: Colors.black.withValues(alpha: 0.65),
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Error Message (જો વેલિડેશન ફેલ થાય તો)
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 14.0),
                child: Text(
                  state.errorText ?? '',
                  style: const TextStyle(
                    color: Color(0xFFF5A344), // warm orange error color
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}