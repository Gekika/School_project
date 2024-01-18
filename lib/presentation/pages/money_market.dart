import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

class money_market extends StatelessWidget {
  final List<MoneyMarketFundButton> funds = [
    MoneyMarketFundButton(
      title: 'CIC bank MMF',
      url: 'https://cic.co.ke/mmf/', // Replace with the URL for Fund 1
    ),
    MoneyMarketFundButton(
      title: 'Standard Chartered MMF',
      url: 'https://www.sc.com/ke/investments/sc-shilingi-funds/', // Replace with the URL for Fund 2
    ),
    MoneyMarketFundButton(
      title: 'Central Bank of Kenya MMF',
      url: 'https://www.sc.com/ke/investments/sc-shilingi-funds', // Replace with the URL for Fund 1
    ),
    MoneyMarketFundButton(
      title: 'ICEA Lion MMF',
      url: 'https://icealion.co.ke/money-market-fund-2/', // Replace with the URL for Fund 1
    ),

    // Add more funds here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Money Market Funds (MMF)',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Add your poster image here
          Image.asset(
            'lib/assets/images/invest.jpg',
            height: 300, // Adjust the height of the poster image as needed
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Welcome to the Money Market Funds!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: funds.length,
              itemBuilder: (context, index) {
                return funds[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoneyMarketFundButton extends StatelessWidget {
  final String title;
  final String url;

  MoneyMarketFundButton({required this.title, required this.url});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.link,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
