import 'package:flutter_calme_onboarding/model/onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> onboardingItems = [
    OnboardingInfo(
      title: 'Teman Ngobrol Sejati',
      description: 'Jadilah dirimu sendiri dengan dukungan penuh dari sahabat setia.',
      image: 'assets/images/onboard_1.svg'
    ),
    OnboardingInfo(
      title: 'Teman AI Penuh Wawasan',
      description: 'Ruang curhat dengan teman AI yang cerdas dan penuh wawasan.',
      image: 'assets/images/onboard_2.svg'
    ),
    OnboardingInfo(
      title: 'Konseling Online Praktis',
      description: 'Terhubung dengan terapis melalui konseling online yang sederhana.',
      image: 'assets/images/onboard_3.svg'
    ),
  ];
}