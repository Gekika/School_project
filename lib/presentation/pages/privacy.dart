import 'package:flutter/material.dart';

// ... (previous code)

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Privacy Policies', style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy for Moneyworks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Last Updated: 12.00am',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '1. Introduction',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome to MONEYWORKS. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application and related services (collectively, the "App"). By using the App, you agree to the terms and conditions of this Privacy Policy.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '2. Information We Collect',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '2.1 Personal Information',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                'We may collect the following types of personal information:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '• User Account Information: When you create an account, we may collect your name, email address, and other relevant information.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '• Financial Information: To enhance your user experience, we may collect information related to your investment preferences, transactions, and other financial activities within the App.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '3. How We Use Your Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'We use the information we collect for the following purposes:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '• To provide and personalize our services.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '• To improve the App\'s functionality and user experience.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '• To send you relevant updates, newsletters, and promotional materials.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '• To respond to your inquiries and provide customer support.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '4. Data Security',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'We take the security of your information seriously and implement industry-standard security measures to protect it from unauthorized access, disclosure, alteration, and destruction.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // ... Add more sections as needed
            ],
          ),
        ),
      ),
    );
  }
}

// ... (remaining code)
