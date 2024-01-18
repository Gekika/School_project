import 'package:flutter/material.dart';

class PeerToPeerLendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peer-to-Peer Lending',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black, // Set app bar background to black
      ),
      body: Container(
        color: Colors.black, // Set background color to grey
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BannerWidget(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, // Set button color to yellow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: Text(
                  'Invest Now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set button text color to black
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Invest in peer-to-peer lending and earn attractive returns on your investments. Diversify your portfolio with secure and high-yielding lending options.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.yellow, // Set text color to yellow
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Our platform connects borrowers with investors, making it easy for you to grow your money while helping others achieve their financial goals.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.yellow, // Set text color to yellow
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Text(
              'Ready to get started?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.yellow, // Set text color to yellow
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.yellow, // Set banner background to yellow
        image: DecorationImage(
          image: AssetImage('lib/assets/images/invest.jpg'), // Replace with your banner image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          'Invest with Confidence',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Set banner text color to black
          ),
        ),
      ),
    );
  }
}
