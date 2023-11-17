import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/screens/history/history_tab_page.dart';
import 'package:ocean_hack/screens/main_page/main_page.dart';
import 'package:ocean_hack/screens/setting_page.dart';

class BottomNavigationArgs {
  BottomNavigationArgs({
    this.selectedIndex = 0,
  });

  int? selectedIndex;
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    this.args,
  });

  final BottomNavigationArgs? args;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  double expandedHeight = 160;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.args?.selectedIndex ?? 0;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    HistoryTabPage(),
    MainPage(),
    SettingsPage(),
  ];

  // _onItemTapped(index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     _pageController.jumpToPage(_selectedIndex);
  //   });
  // }

  // void goToPage(index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     _pageController.jumpToPage(_selectedIndex);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabBackgroundGradient: const LinearGradient(colors: [
            ehpPrimaryColor,
            ehpPrimaryColor
          ]), // Set background color to red
          tabMargin: const EdgeInsets.all(5), // Adjust margin as needed
          tabActiveBorder: Border.all(
            color: ehpPrimaryColor,
          ),
          tabs: const [
            GButton(
              padding: EdgeInsets.all(15),
              icon: Icons.home,
              text: 'Home',
              gap: 8,
              duration: Duration(milliseconds: 400),
              backgroundColor: ehpPrimaryColor,
              iconColor: Colors.black,
              textColor: Colors.white,
              iconActiveColor: Colors.white,
            ),
            GButton(
              padding: EdgeInsets.all(15),
              icon: Icons.history,
              text: 'History',
              backgroundColor: ehpPrimaryColor,
              iconColor: Colors.black,
              textColor: Colors.white,
              iconActiveColor: Colors.white,
            ),
            GButton(
              padding: EdgeInsets.all(15),
              icon: Icons.book,
              text: 'Education',
              backgroundColor: ehpPrimaryColor,
              iconColor: Colors.black,
              textColor: Colors.white,
              iconActiveColor: Colors.white,
            ),
            GButton(
              padding: EdgeInsets.all(15),
              icon: Icons.settings,
              text: 'Settings',
              backgroundColor: ehpPrimaryColor,
              iconColor: Colors.black,
              textColor: Colors.white,
              iconActiveColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
