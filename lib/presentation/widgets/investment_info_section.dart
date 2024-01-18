import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../style/color.dart';
import 'WebViewScreen.dart';

// ... Previous imports and code ...

class InvestmentInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: Text(
            'HOW DO THEY WORK??',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        SizedBox(
          height: 600, // Adjust the height as needed
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical, // Change to vertical
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: investmentInfoList.length,
            itemBuilder: (context, index) {
              final info = investmentInfoList[index];
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      info.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor.withOpacity(0.75),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the WebView page using the route
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: info.url), // Pass the URL
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Learn More'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class InvestmentInfo {
  final String title;
  final String description;
  final String url; // Add the URL property

  InvestmentInfo({required this.title, required this.description, required this.url});
}

final List<InvestmentInfo> investmentInfoList = [
  InvestmentInfo(
    title: 'Nairobi Security Exchange',
    description: 'Learn about investing in the Nairobi Security Exchange, and how they work in the financial market.',
    url: 'https://www.nse.co.ke/about-nse//',
  ),
  InvestmentInfo(
    title: 'Real Estate',
    description: 'Explore the world of real estate investment and how to make profitable property investments.',
    url: 'https://www.investopedia.com/mortgage/real-estate-investing-guide/',
  ),
  InvestmentInfo(
    title: 'Mutual Funds',
    description: 'Understand mutual funds and how they can be a great option for diversified investment.',
    url: 'https://www.nerdwallet.com/article/investing/how-to-invest-in-mutual-funds',
  ),
  InvestmentInfo(
    title: 'Stocks and Bonds',
    description: 'Learn about investing in stocks and bonds, and how they work in the financial market.',
    url: 'https://www.iwillteachyoutoberich.com/all-about-stocks-and-bonds/',
  ),
  InvestmentInfo(
    title: 'Cryptocurrencies',
    description: 'Discover the exciting world of cryptocurrencies and how to invest in this digital asset class.',
    url: 'https://learncrypto.com/',
  ),
];
