import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../style/color.dart';
import 'WebViewScreen.dart';

// ... Previous imports and code ...

class investkenya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(45.0),
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
    title: 'PROPOSED MALEWA RIDGE ECO-RESORT',
    description: 'Visionary project situated in Nakuru County',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/proposed-malewa-ridge-eco-resort/',
  ),
  InvestmentInfo(
    title: 'Proposed Export Trading Hub (ETH )',
    description: 'Farmers and SMEs lack the capacity to access markets',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/proposed-export-trading-hub-eth/',
  ),
  InvestmentInfo(
    title: 'KenGen Energy Park',
    description: 'company listed on the Nairobi Securities Exchange (NSE)',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/kengen-energy-park/',
  ),
  InvestmentInfo(
    title: 'INVEST IN THE DONGO KUNDU FERTILIZER MANUFACTURING PLANT',
    description: 'Agriculture accounts for approximately 22% of Kenya''s GDP',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/invest-in-the-dongo-kundu-fertilizer-manufacturing-plant/',
  ),
  InvestmentInfo(
    title: 'EPZA ATHIRIVER RESIDENTIAL ESTATE',
    description: 'Need for development of housing that is proximal to their manufacturing facilities both for the investors and their workers',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/epza-athiriver-residential-estate/',
  ),
  InvestmentInfo(
    title: 'Powdered Milk Factory and strategic',
    description: 'structured milk market is facilitated by coordinated dairy industry players',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/powdered-milk-factory-and-strategic/',
  ),
  InvestmentInfo(
    title: 'RAILWAY SIDING',
    description: ' reduce the cost of transportation of cargo (for both raw materials and finished products) from and to Mombasa Port',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/railway-siding-1/',
  ),
  InvestmentInfo(
    title: 'SOLAR POWERED BIO MEDICAL MANUFACTURING PLANT',
    description: ' Manufacturing plant that will be filling/sealing IV fluids at a nominal capacity of 1250 bags per hou',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/solar-powered-bio-medical-manufacturing-plant/',
  ),
  InvestmentInfo(
    title: 'PROPOSED ISIOLO DAM',
    description: ' proposed dam is located at Crocodile Jaws site approximately 18 km from Oldonyiro shopping centre ',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/proposed-isiolo-dam/',
  ),
  InvestmentInfo(
    title: 'NEA BY NATURE',
    description: ' ompany has done a feasibility study and is seeking funding worth USD 242,510 from an investor ',
    url: 'https://opportunities.invest.go.ke/opportunities/opportunity/nea-by-nature/',
  ),
];
