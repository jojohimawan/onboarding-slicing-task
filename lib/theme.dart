import 'package:flutter/material.dart';

Color primaryBlue = const Color(0xFF02BBDD);
Color primaryDark = const Color(0xFF1D1D1D);
Color secondaryDark = const Color(0xFF5F6265);
Color tertiaryDark = const Color(0xFFDFE0E0);

TextStyle large = const TextStyle(
  fontFamily: 'PlusJakartaSans',
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

TextStyle regular = const TextStyle(
  fontFamily: 'PlusJakartaSans',
  fontSize: 14,
);

TextStyle onboardingTitle = large.copyWith(
  color: primaryDark
);

TextStyle onboardingSubtitle = regular.copyWith(
  color: secondaryDark,
  fontWeight: FontWeight.w400
);

TextStyle buttonPrimary = regular.copyWith(
  color: Colors.white,
  fontWeight: FontWeight.w600
);

TextStyle buttonSecondary = regular.copyWith(
  color: primaryDark,
  fontWeight: FontWeight.w600
);