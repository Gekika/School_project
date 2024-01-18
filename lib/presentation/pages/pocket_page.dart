import 'package:flutter/material.dart';
import 'package:invest/common/function/card_number_gap.dart';
import 'package:invest/common/gap.dart';
import 'package:invest/common/skeleton.dart';
import 'package:invest/common/static.dart';
import 'package:invest/data/repository/repository.dart';
import 'package:invest/presentation/pages/money_market.dart';
import 'package:invest/presentation/pages/settings_page.dart';
import 'package:invest/presentation/widgets/investkenya.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';
import 'package:skeletons/skeletons.dart';

import '../widgets/investment_info_section.dart';
import 'Equity_based_trust_funds.dart';
import 'Fixed_depo.dart';
import 'Online_peer_to_peer.dart';
import 'Treasury_bills.dart';
import 'History_page.dart';
import 'home_page.dart';

class PocketPage extends StatefulWidget {
  const PocketPage({Key? key}) : super(key: key);
  static const routeName = '/pocket';

  @override
  State<PocketPage> createState() => _PocketPageState();
}

class _PocketPageState extends State<PocketPage> {
  bool _isLoad = true;

  void isLoadingSuccess() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoad = false;
      });
    });
  }

  @override
  void initState() {
    isLoadingSuccess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerSection(),

                investkenya(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded resourceSection() {
    return Expanded(
      child: ListView(
        children: [

          investkenya(),
        ],
      ),
    );
  }





  Container headerSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Text('    INVESTMENT CHANNELS',
            style: poppinsH1.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
