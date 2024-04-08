import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_calme_onboarding/theme.dart';
import 'package:flutter_calme_onboarding/static/onboarding_items.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  late PageController pageController;

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    print(pageController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 150,
        padding: const EdgeInsets.fromLTRB(26, 0, 26, 48),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: controller.onboardingItems.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn),
              effect: WormEffect(
                dotColor: tertiaryDark,
                activeDotColor: primaryBlue,
                dotWidth: 32,
                dotHeight: 8,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: secondaryDark, style: BorderStyle.solid)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          isLastPage ? 'Register' : 'Lewati',
                          style: buttonSecondary,
                        ),
                      )),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: FilledButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryBlue)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          isLastPage ? 'Login' : 'Lanjut',
                          style: buttonPrimary,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(26, 48, 26, 209),
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) => setState(() {
              isLastPage = controller.onboardingItems.length - 1 == index;
            }),
            itemCount: controller.onboardingItems.length,
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SvgPicture.asset('assets/images/logogram.svg')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(controller.onboardingItems[index].image)
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          controller.onboardingItems[index].title,
                          style: onboardingTitle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          controller.onboardingItems[index].description,
                          style: onboardingSubtitle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }
}
