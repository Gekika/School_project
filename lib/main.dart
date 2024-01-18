import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invest/presentation/pages/History_page.dart';
import 'package:invest/presentation/pages/home_page.dart';
import 'package:invest/presentation/pages/introduction_page.dart';
import 'package:invest/presentation/pages/signin_page.dart';
import 'package:invest/presentation/pages/pocket_page.dart';

import 'package:invest/presentation/pages/settings_page.dart';
import 'package:invest/presentation/pages/signup_page.dart';
import 'package:invest/presentation/pages/splash_page.dart';
import 'package:invest/presentation/widgets/navbar_widget.dart';
import 'package:invest/style/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: primaryColor,
      ),
      initialRoute: SplashPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case NavigationBarWidget.routeName:
            return MaterialPageRoute(builder: (_) => const NavigationBarWidget());
          case SplashPage.routeName:
            return MaterialPageRoute(builder: (_) => const SplashPage());
          case IntroductionPage.routeName:
            return MaterialPageRoute(builder: (_) => const IntroductionPage());
          case SigninPage.routeName:
            return MaterialPageRoute(builder: (_) => const SigninPage());
          case SignupPage.routeName:
            return MaterialPageRoute(builder: (_) => const SignupPage());
          case HomePage.routeName:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case PocketPage.routeName:
            return MaterialPageRoute(builder: (_) => const PocketPage());
          case HistoryPage.routeName:
            return MaterialPageRoute(builder: (_) => const HistoryPage());
          case SettingsPage.routeName:
            return MaterialPageRoute(builder: (_) => const SettingsPage());
          default:
            return null;
        }
      },
    );
  }
}
