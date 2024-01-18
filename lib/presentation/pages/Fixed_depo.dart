import 'package:flutter/material.dart';

class FixedDepositAccountPage extends StatelessWidget {
  final List<FixedDepositAccountButton> accounts = [
    FixedDepositAccountButton(
      title: 'Standard Chartered Bank',
      url: 'https://www.sc.com/ke/',
    ),
    FixedDepositAccountButton(
      title: 'ABC Bank',
      url: 'https://www.abcthebank.com/',
    ),
    FixedDepositAccountButton(
      title: 'Kenya Commercial Bank (KCB)',
      url: 'https://ke.kcbgroup.com/',
    ),
    FixedDepositAccountButton(
      title: 'Equity Bank',
      url: 'https://www.equitybankgroup.com/ke/',
    ),
    // Add more fixed deposit accounts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fixed Deposit Accounts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return accounts[index];
        },
      ),
    );
  }
}

class FixedDepositAccountButton extends StatelessWidget {
  final String title;
  final String url;

  FixedDepositAccountButton({required this.title, required this.url});



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
              Icons.monetization_on_rounded,
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
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
