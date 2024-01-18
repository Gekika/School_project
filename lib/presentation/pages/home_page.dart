import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invest/common/gap.dart';
import 'package:invest/common/skeleton.dart';
import 'package:invest/common/static.dart';
import 'package:invest/data/model/saving_target_model.dart';
import 'package:invest/data/model/transaction_model.dart';
import 'package:invest/data/repository/repository.dart';
import 'package:invest/presentation/pages/pocket_page.dart';
import 'package:invest/presentation/pages/settings_page.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skeletons/skeletons.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'History_page.dart';
import 'Treasury_bills.dart'; // Firebase authentication
import 'package:invest/presentation/widgets/investment_info_section.dart';


class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';


 @override
State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  bool _isLoad = true;
  bool _isHidden = true;
  bool _isMore = true;



  void isLoadingSuccess() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoad = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    isLoadingSuccess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('lib/assets/images/invest.jpg'), fit: BoxFit.cover),

          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                profileSection(),
                welcomeSection(),
                const VerticalGap20(),
                const VerticalGap20(),
                customWelcomeSection(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget possibleInvestmentSection(BuildContext context) {
    return Skeleton(
      duration: const Duration(seconds: 2),
      isLoading: _isLoad,
      themeMode: ThemeMode.dark,
      darkShimmerGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          secondaryColor,
          secondaryColor.withOpacity(.75),
          secondaryColor,
        ],
        tileMode: TileMode.repeated,
      ),
      skeleton: const MediumSkeleton(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Possible Investment Amount',
                  style: poppinsBody2.copyWith(
                    color: textColor.withOpacity(.75),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget savingTargetSection(BuildContext context) {
    return Skeleton(
      duration: const Duration(seconds: 2),
      isLoading: _isLoad,
      themeMode: ThemeMode.dark,
      darkShimmerGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          secondaryColor,
          secondaryColor.withOpacity(.75),
          secondaryColor,
        ],
        tileMode: TileMode.repeated,
      ),
      skeleton: const MediumSkeleton(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            const VerticalGap10(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: FutureBuilder<List<SavingTargetModel>>(
                future: Repository().getSavingTarget(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const HorizontalGap10(),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        final formatter = NumberFormat('#,###');
                        final savingValue = formatter.format(data[index].hasSaving);
                        final targetValue = formatter.format(data[index].totalSaving);
                        return GestureDetector(
                          onTap: () {
                            // Handle the click action for the purpose name here
                            // For example, you can navigate to a new screen or perform an action
                            print('Clicked on purpose name at index $index');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TreasuryBillScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondaryColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data[index].purposeName,
                                      style: poppinsBody1.copyWith(
                                        color: textColor.withOpacity(.75),
                                      ),
                                    ),
                                    const VerticalGap5(),
                                    Text(
                                      '$savingValue',
                                      style: poppinsBody1.copyWith(
                                        fontSize: 28,
                                        color: buttonColor,
                                      ),
                                    ),
                                    const VerticalGap5(),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Handle the click action for the circular button here
                                    // For example, you can navigate to a new screen or perform an action
                                    print('Clicked on the circular button at index $index');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TreasuryBillScreen(),
                                      ),
                                    );
                                  },
                                  child: CircularPercentIndicator(
                                    radius: 40,
                                    lineWidth: 6,
                                    percent: data[index].hasSaving / data[index].totalSaving,
                                    center: Text(
                                      '${(data[index].hasSaving / data[index].totalSaving * 100).toStringAsFixed(0)}%',
                                      style: poppinsBody1.copyWith(
                                        color: textColor,
                                      ),
                                    ),
                                    backgroundColor: textColor.withOpacity(.1),
                                    progressColor: buttonColor,
                                    animation: true,
                                    animationDuration: 2000,
                                    animateFromLastPercent: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: buttonColor,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget profileSection() {
    // Function to display a greeting based on the current time
    String greetingMessage() {
      final hour = DateTime.now().hour;
      if (hour >= 5 && hour < 12) {
        return 'Good morning!';
      } else if (hour >= 12 && hour < 18) {
        return 'Good afternoon!';
      } else {
        return 'Good evening!';
      }
    }

    // Access the current user's information from FirebaseAuth
    final User? user = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator while data is being fetched
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || !snapshot.data!.exists) {
          return Text('User data not found'); // Handle the case where user data is not available
        }

        var userData = snapshot.data!.data()!;
        String displayName = userData.containsKey('fullName') ? userData['fullName'] : "";

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greetingMessage(),
                  style: poppinsBody2.copyWith(
                    color: textColor.withOpacity(.75),
                  ),
                ),
                Text(
                  displayName,
                  style: poppinsBody1.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  image: DecorationImage(
                    image: userData.containsKey('profile') ? NetworkImage(userData['profile']) : AssetImage('lib/assets/images/profile.jpg') as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(8),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget welcomeSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Center content vertically
          children: [
            Text(
              'MoneyWorks',
              style: poppinsH2.copyWith(
                color: Colors.yellow,  // Replace with your desired color
                fontWeight: FontWeight.bold,
                fontSize: 46,  // Adjust the font size as needed
              ),
            ),
            const VerticalGap5(),
            const VerticalGap10(),
            Text(
              'Unlock financial freedom with knowledge. Your journey to smart investing begins here.',
              style: poppinsBody1.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,  // Center text horizontally
            ),
          ],
        ),
      ),
    );
  }

  Widget customWelcomeSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _buildSection(
            ' Financial Overview',
            'Financial health and track your progress with MoneyWorks.',
            Colors.white60,
                () {
                  Navigator.pushNamed(context, HistoryPage.routeName);
            },
          ),
          const VerticalGap10(),
          _buildSection(
            'Smart Investing Tips',
            'Discover expert tips and strategies to make smart investment decisions.',
            Colors.white60,
                () {
                  Navigator.pushNamed(context, PocketPage.routeName);
            },
          ),
          const VerticalGap10(),
          _buildSection(
            ' Privacy and Policies',

                'Privacy and policies',
            Colors.white60,
                () {
                  Navigator.pushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.yellow, // Set the desired color for the title
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // You can customize the color for the description
              ),
            ),
          ],
        ),
      ),
    );
  }



 /* Widget _buildSection(String title, String content, Color color) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: poppinsH2.copyWith(
              color: Colors.white,  // Replace with your desired color
              fontWeight: FontWeight.bold,
              fontSize: 24,  // Adjust the font size as needed
            ),
          ),
          const VerticalGap5(),
          const VerticalGap10(),
          Text(
            content,
            style: poppinsBody1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }*/






}
