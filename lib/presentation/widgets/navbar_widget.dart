import 'package:flutter/material.dart';
import 'package:invest/presentation/pages/History_page.dart';
import 'package:invest/presentation/pages/home_page.dart';
import 'package:invest/presentation/pages/pocket_page.dart';
import 'package:invest/presentation/pages/settings_page.dart';
import 'package:invest/style/color.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});
  static const routeName = '/navigation-bar';

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;
  final List widgetIcons = const [
    Icons.home,
    Icons.wallet_rounded,
    Icons.cast_for_education,
    Icons.settings,
  ];
  final List widgetTitles = const [
    'Home',
    'Pocket',
    'Educate',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomePage(),
            PocketPage(),
            HistoryPage(),
            SettingsPage(),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/qr-scanner-page');
          },
          backgroundColor: buttonColor,
          elevation: 0,
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            color: Colors.white, // Change the FAB icon color to white
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
          color: primaryColor,
          elevation: 10,
          notchMargin: 10,
          shadowColor: textColor,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(0);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[0],
                              color: _selectedIndex == 0 ? buttonColor : Colors.white, // Change the icon color to white
                            ),
                          ),
                          Text(
                            widgetTitles[0],
                            style: TextStyle(
                              color: _selectedIndex == 0 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(1);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[1],
                              color: _selectedIndex == 1 ? buttonColor : Colors.white, // Change the icon color to white
                            ),
                          ),
                          Text(
                            widgetTitles[1],
                            style: TextStyle(
                              color: _selectedIndex == 1 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(2);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[2],
                              color: _selectedIndex == 2 ? buttonColor : Colors.white, // Change the icon color to white
                            ),
                          ),
                          Text(
                            widgetTitles[2],
                            style: TextStyle(
                              color: _selectedIndex == 2 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(3);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[3],
                              color: _selectedIndex == 3 ? buttonColor : Colors.white, // Change the icon color to white
                            ),
                          ),
                          Text(
                            widgetTitles[3],
                            style: TextStyle(
                              color: _selectedIndex == 3 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
