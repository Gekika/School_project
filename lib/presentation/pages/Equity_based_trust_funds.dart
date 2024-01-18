import 'package:flutter/material.dart';

class RealEstateInvestmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to Invest in Real Estate',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... Existing content ...
            SizedBox(height: 16),
            Text(
              '8. Monitor and Review Your Investment',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Regularly monitor the performance of your real estate investment and review its progress towards your set goals. Make adjustments as needed to optimize returns and ensure your investment remains on track.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32), // Add some extra space before the button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add the desired action when the "Proceed" button is clicked.
                  // For example, you can navigate to another page using Navigator.
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, // Set button color to yellow
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
