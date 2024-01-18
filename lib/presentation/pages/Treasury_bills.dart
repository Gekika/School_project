import 'package:flutter/material.dart';
import 'Tbills.dart';


class TreasuryBillScreen extends StatelessWidget {
  final List<TreasuryBill> treasuryBills = [
    TreasuryBill(
      name: '91-day Treasury Bill',
      maturity: '91 days',
      interestRate: '7.5%',
      minimumInvestment: 'KES 100,000',
      riskLevel: 'Low',
    ),
    TreasuryBill(
      name: '182-day Treasury Bill',
      maturity: '182 days',
      interestRate: '8.0%',
      minimumInvestment: 'KES 100,000',
      riskLevel: 'Low',
    ),
    TreasuryBill(
      name: '364-day Treasury Bill',
      maturity: '1 year',
      interestRate: '8.5%',
      minimumInvestment: 'KES 100,000',
      riskLevel: 'Low',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kenya Treasury Bills'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView.builder(
          itemCount: treasuryBills.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: InkWell(
                onTap: () {
                  // Navigate to the TreasuryBillDetailScreen passing the selected TreasuryBill
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TreasuryBillDetailScreen(treasuryBill: treasuryBills[index]),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(treasuryBills[index].name, context), // Pass the name and context to _buildHeader method
                      const SizedBox(height: 8),
                      Text(
                        'Maturity: ${treasuryBills[index].maturity}',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Interest Rate: ${treasuryBills[index].interestRate}',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Minimum Investment: ${treasuryBills[index].minimumInvestment}',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Risk Level: ${treasuryBills[index].riskLevel}',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(String name, BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the TreasuryBillDetailScreen passing the selected TreasuryBill
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TreasuryBillDetailScreen(
              treasuryBill: treasuryBills.firstWhere((bill) => bill.name == name),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(width: 8),
            Text(
              name,
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

class TreasuryBill {
  final String name;
  final String maturity;
  final String interestRate;
  final String minimumInvestment;
  final String riskLevel;

  TreasuryBill({
    required this.name,
    required this.maturity,
    required this.interestRate,
    required this.minimumInvestment,
    required this.riskLevel,
  });
}
