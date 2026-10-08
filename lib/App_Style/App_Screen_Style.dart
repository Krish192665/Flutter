import 'package:flutter/material.dart';

/// 1. એપ્લિકેશનના કલર્સ (App Colors)
class AppColors {
  static const Color primaryNavy = Color(0xFF2C3E5D); // મુખ્ય બેકગ્રાઉન્ડ
  static const Color cardNavy = Color(0xFF202F46);    // કાર્ડ્સનું બેકગ્રાઉન્ડ
  static const Color cardNavyLight = Color(0xFF263852);
  static const Color selectedBorder = Color(0xFF2196F3);
  static const Color accentOrange = Color(0xFFF9A81B); // મેઈન ઓરેન્જ કલર
  static const Color inputTextColor = Color(0xFF1E1E1E);
  static const Color iconColor = Color(0xFF2D2D2D);
  static const Color subtitleGray = Color(0xFF8FA3BE);
  static const Color unselectedIndicator = Color(0xFF2E4057);
  static const Color white = Colors.white;
  static const Color errorColor = Colors.orangeAccent;
  static const Color buttonTextColor = Colors.black;
  static const Color dividerColor = Colors.white12;
  static const Color otpCircleFill = Color(0xFFD9DDE2);
  static const Color footerInactive = Colors.white70; // Inactive footer icon/text
  static const Color darkText = Color(0xFF1E1E1E);
static const Color statusBlue = Color(0xFF2196F3);   // In Progress (Cyan/Blue)
  static const Color statusGreen = Color(0xFF00E676); 
  }


/// 2. ફોન્ટ સ્ટાઇલ્સ (Typography / Text Styles)
class AppTextStyles {
  // હેડર ટાઇટલ્સ
  static const TextStyle headerTitle = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );

  static const TextStyle roleHeaderTitle = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
  );

  // સબટાઇટલ (About Us, Contact Us, Role માટે)
  static const TextStyle subtitle = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle roleSubtitle = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // સેક્શન હેડિંગ
  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
  );

  // સામાન્ય કાર્ડ ટાઇટલ અને ડિસ્ક્રિપ્શન (About Us અને Contact Us માટે)
  static const TextStyle cardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardDescription = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 13,
    height: 1.4,
  );

  // બ્રાન્ડ નેમ (SubSetu)
  static const TextStyle brandTitle = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // રોલ કાર્ડ ટાઇટલ અને ડિસ્ક્રિપ્શન
  static const TextStyle roleCardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle roleCardDescription = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  // Support Cards
  static const TextStyle supportCardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle supportCardSubtitle = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  // FAQ ક્વેશ્ચન અને આન્સર
  static const TextStyle faqQuestion = TextStyle(
    color: AppColors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle faqAnswer = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 13,
    height: 1.4,
  );

  // ઇનપુટ ફિલ્ડ લેબલ
  static const TextStyle fieldLabel = TextStyle(
    color: AppColors.white,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  // ઇનપુટ ટેક્સ્ટ
  static const TextStyle inputText = TextStyle(
    color: AppColors.inputTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  // Hint ટેક્સ્ટ
  static TextStyle inputHint = TextStyle(
    color: AppColors.inputTextColor.withValues(alpha: 0.6),
    fontSize: 15,
  );

  // Submit / Send / Continue બટન ટેક્સ્ટ
  static const TextStyle submitButtonText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    color: AppColors.buttonTextColor,
    letterSpacing: 0.5,
  );

  // ફૂટર ટેક્સ્ટ
  static const TextStyle footerText = TextStyle(
    color: AppColors.white,
    fontSize: 15,
  );

  // ફૂટર સાઇન-ઇન / લિંક ટેક્સ્ટ
  static const TextStyle footerLink = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  // એરર મેસેજ સ્ટાઇલ
  static const TextStyle errorText = TextStyle(
    color: AppColors.errorColor,
    fontWeight: FontWeight.w500,
  );
// અંડરલાઇન સાથેનું ટાઇટલ
  static const TextStyle verificationTitle = TextStyle(
    color: AppColors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationThickness: 2.0,
  );
  // OTP સર્કલ અંદરના બોલ્ડ નંબર્સ
  static const TextStyle otpDigitText = TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle greyInputText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

   static const TextStyle loginHeaderTitle = TextStyle(
    color: AppColors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );
  // Home Card Title ("Logo Text Here technology pty.ltd")
  static const TextStyle homeCardTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    letterSpacing: 0.2,
  );
  // Home Card Subtitle ("Best CNC Technology")
  static const TextStyle homeCardSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
  );
  // View More Text
  static const TextStyle viewMoreText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );
  // Bottom Navigation Label
  static const TextStyle navLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

static const TextStyle businessHeaderTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );
  static const TextStyle subheaderGray = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitleGray,
  );
  // Stat Card Label (e.g., Total Job, Pending)
  static const TextStyle statCardLabel = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.2,
  );
  // Order Card Title
  static const TextStyle orderCardTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  // Order Card Date
  static const TextStyle orderCardDate = TextStyle(
    fontSize: 13,
    color: AppColors.subtitleGray,
  );

  // Capabilities Section Title
  static const TextStyle capabilitiesTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.2,
  );
  }

/// 3. ઇનપુટ, કાર્ડ અને બટન ડેકોરેશન (Widget Styles)
class AppStyles {
  // About Us અને Contact Us કાર્ડ ડેકોરેશન (નવું ઉમેર્યું)
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(18),
    border: Border.all(color: Colors.white10),
  );

  // કોન્ટેક્ટ આઇકોન સર્કલ બેકગ્રાઉન્ડ
  static BoxDecoration iconCircleDecoration = BoxDecoration(
    color: AppColors.accentOrange.withValues(alpha: 0.15),
    shape: BoxShape.circle,
  );

  // Support Action Cards ડેકોરેશન
  static BoxDecoration supportCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white10),
  );

  // FAQ Card Decoration
  static BoxDecoration faqCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: Colors.white10),
  );

// OTP ગોળાકાર બોક્સ ડેકોરેશન
  static const BoxDecoration otpCircleDecoration = BoxDecoration(
    color: AppColors.otpCircleFill,
    shape: BoxShape.circle,
  );

   // બે-કલર વાળા Pill Input Box નું ડેકોરેશન
  static BoxDecoration splitInputBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(26),
  );

  // Role Selection Card Decoration
  static BoxDecoration roleCardDecoration({required bool isSelected}) {
    return BoxDecoration(
      color: AppColors.cardNavy,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSelected ? AppColors.selectedBorder : Colors.transparent,
        width: 2.2,
      ),
      boxShadow: isSelected
          ? [
              BoxShadow(
                color: AppColors.selectedBorder.withValues(alpha: 0.3),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ]
          : null,
    );
  }

  // સિંગલ લાઇન ઇનપુટ બોક્સ ડેકોરેશન
  static InputDecoration inputDecoration({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.accentOrange,
      hintText: hintText,
      hintStyle: AppTextStyles.inputHint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      errorStyle: AppTextStyles.errorText,
    );
  }

  // મલ્ટીલાઇન મેસેજ બોક્સ માટેનું ડેકોરેશન (Contact Us & Support માટે)
  static InputDecoration textAreaDecoration({String? hintText}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.accentOrange,
      hintText: hintText,
      hintStyle: AppTextStyles.inputHint,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      errorStyle: AppTextStyles.errorText,
    );
  }

  // Primary Rounded Button (Submit / Continue / Send)
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    foregroundColor: AppColors.buttonTextColor,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
  );
  // New Password સ્ક્રીનના ઇનપુટ બોક્સ માટે (Image મુજબનો Error Color સાથેનું Decoration)
  static InputDecoration greyInputDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF707F95), // ઇમેજનો exact સ્લેટ ગ્રે-બ્લુ કલર
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.white, // ઇમેજમાં હિન્ટ ટેક્સ્ટ વાઇટ છે
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      // ઇમેજ જેવી ઊંચાઈ અને અંદરની જગ્યા
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      ),
      // ઇમેજ જેવો જ સંપૂર્ણ Pill / Oval શેપ
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(
          color: Colors.white30,
          width: 1.5,
        ),
      ),

      // 🟠 ઇમેજ મુજબનો Error Message Color (Enter company name વાળો કલર)
      errorStyle: const TextStyle(
        color: Color(0xFFF5A344), // સ્ક્રીનશોટનો exact warm orange કલર
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),

      // એરર આવે ત્યારે પણ Pill શેપ જળવાઈ રહે તે માટે
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(
          color: Color(0xFFF5A344),
          width: 1.2,
        ),
      ),
    );
  }
  // Business Register Dark Input Box Decoration
  static InputDecoration businessInputDecoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.cardNavy,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF6B7E96),
        fontSize: 14,
      ),
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentOrange, width: 1.2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.orangeAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.orangeAccent, width: 1.2),
      ),
    );
  }
}
