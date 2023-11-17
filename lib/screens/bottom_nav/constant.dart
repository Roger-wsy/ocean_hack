import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    activeIcon: bottomIcon(Icons.home),
    icon: bottomIcon(
      Icons.home_outlined,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: bottomIcon(
      Icons.schedule,
    ),
    label: 'Schedule',
  ),
  BottomNavigationBarItem(
    activeIcon: bottomIcon(Icons.book),
    icon: bottomIcon(
      Icons.book_outlined,
    ),
    label: 'Modules',
  ),
  BottomNavigationBarItem(
    icon: bottomIcon(
      Icons.file_copy,
    ),
    label: 'Report',
  ),
  BottomNavigationBarItem(
    icon: bottomIcon(
      Icons.settings,
    ),
    label: 'Settings',
  ),
];

Padding bottomIcon(icon) {
  return Padding(
    padding: EhpPadding.a2,
    child: Icon(icon),
  );
}
