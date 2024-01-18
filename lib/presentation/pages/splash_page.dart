import 'package:flutter/material.dart';
import 'package:invest/common/gap.dart';
import 'package:invest/presentation/pages/introduction_page.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, IntroductionPage.routeName);
    });
  }

  @override
  initState() {
    super.initState();
    navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: secondaryColor,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.monetization_on_sharp,
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
                      Icons.mobile_friendly,
                      size: 40,
                      color: buttonColor,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap10(),
            Row(
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
          ],
        ),
      ),
    );
  }
}
