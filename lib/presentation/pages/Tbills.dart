import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/WebViewScreen.dart';
import 'Treasury_bills.dart';

class TreasuryBillDetailScreen extends StatefulWidget {
  final TreasuryBill treasuryBill;

  TreasuryBillDetailScreen({required this.treasuryBill});

  @override
  State<TreasuryBillDetailScreen> createState() => _TreasuryBillDetailScreenState();
}

class _TreasuryBillDetailScreenState extends State<TreasuryBillDetailScreen> {
  String url = 'https://chat.openai.com/?model=text-davinci-002-render-sha';

  void _launchURL() async {
    String url = 'https://www.centralbank.go.ke/securities/treasury-bills/';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  void _openWebView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: 'https://www.centralbank.go.ke/securities/treasury-bills/'),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.treasuryBill.name),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 16),
            _buildInformationSection(),
            SizedBox(height: 16),
            _buildHowItWorksSection(),
            SizedBox(height: 16),
            _buildApplyButton(context), // Pass the BuildContext to the _buildApplyButton method
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Add any additional header elements here if needed
          SizedBox(width: 8),
          Text(
            widget.treasuryBill.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Maturity: ${widget.treasuryBill.maturity}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Interest Rate: ${widget.treasuryBill.interestRate}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Minimum Investment: ${widget.treasuryBill.minimumInvestment}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Risk Level: ${widget.treasuryBill.riskLevel}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How It Works',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '1. The ${widget.treasuryBill
                .name} is a short-term debt instrument issued by the Kenyan government through the Central Bank of Kenya.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '2. It is sold through auctions at a discount, and investors receive the face value at maturity.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '3. The interest rate is determined through competitive bidding at the auction, with successful bidders receiving the highest accepted rate.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '4. The ${widget.treasuryBill
                .name} is considered a risk-free investment as it is backed by the Kenyan government.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _openWebView();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text('Apply'),
      ),
    );
  }

}



