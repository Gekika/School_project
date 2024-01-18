import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:invest/presentation/pages/signin_page.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  static const routeName = '/introduction';

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
            pages: [
              pageViewOne(),
              pageViewTwo(),
              pageViewThree(),
            ],
            onDone: () {
              Navigator.pushReplacementNamed(context, SigninPage.routeName);
            },
            onSkip: () {
              Navigator.pushReplacementNamed(context, SigninPage.routeName);
            },
            showSkipButton: true,
            skip: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: secondaryColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Skip',
                style: poppinsH4.copyWith(color: textColor),
              ),
            ),
            next: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: buttonColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Next',
                style: poppinsH4.copyWith(color: text2Color),
              ),
            ),
            done: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: buttonColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Done',
                style: poppinsH4.copyWith(color: text2Color),
              ),
            ),
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: buttonColor,
              color: secondaryColor,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            )),
      ),
    );
  }

  PageViewModel pageViewThree() {
    return PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MONEY',
            style: poppinsH1.copyWith(color: textColor),
          ),
          Text(
            'WORKS',
            style: poppinsH1.copyWith(color: buttonColor),
          ),
        ],
      ),
      bodyWidget: Column(
        children: [
          Text(
            ' With MoneyWorks Kenya, you will embrace a revolutionary approach to financial growth. Instead of working hard for money, let your money work hard for you, gain knowledge to Invest in carefully curated opportunities',
            style: poppinsBody1.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      image: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: secondaryColor,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.security_rounded,
              size: 120,
              color: textColor,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: secondaryColor,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.policy_rounded,
                size: 40,
                color: buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PageViewModel pageViewTwo() {
    return PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MONEY',
            style: poppinsH1.copyWith(color: textColor),
          ),
          Text(
            'WORKS',
            style: poppinsH1.copyWith(color: buttonColor),
          ),
        ],
      ),
      bodyWidget: Column(
        children: [
          Text(
            "Our platform is designed to provide you with insightful tools and valuable resources, helping you make educated investment decisions.",
            style: poppinsBody1.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      image: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: secondaryColor,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              size: 120,
              color: textColor,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: secondaryColor,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.cloud_circle_rounded,
                size: 40,
                color: buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PageViewModel pageViewOne() {
    return PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MONEY',
            style: poppinsH1.copyWith(color: textColor),
          ),
          Text(
            'WORKS',
            style: poppinsH1.copyWith(color: buttonColor),
          ),
        ],
      ),
      bodyWidget: Column(
        children: [
          Text(
            "Welcome to MoneyWorks Kenya  Discover the future of financial freedom with MoneyWorks, the cutting-edge investing  resource application that empowers you to harness the full potential of your hard-earned money",
            style: poppinsBody1.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      image: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: secondaryColor,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.monetization_on_rounded,
              size: 120,
              color: textColor,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: secondaryColor,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.qr_code_rounded,
                size: 40,
                color: buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
