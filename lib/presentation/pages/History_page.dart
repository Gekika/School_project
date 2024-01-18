import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invest/common/gap.dart';
import 'package:invest/data/repository/repository.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';

import 'package:flutter/material.dart';
import '../widgets/WebViewScreen.dart';
import '../widgets/investment_info_section.dart';
// Import your separate WebView widget
// ... other imports ...

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  static const routeName = '/history-page';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              headerSection(),
              const VerticalGap10(),
              resourceSection(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded resourceSection() {
    return Expanded(
      child: ListView(
        children: [

          InvestmentInfoSection(),
          ],
      ),
    );
  }










  Row headerSection() {
    return const Row(
      children: [
        /*Icon(
          Icons.history_edu_rounded,
          size: 28,
          color: textColor,
        ),*/

        Text(
          'FINANCIAL  KNOWLEDGE ',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
