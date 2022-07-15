import 'package:flutter/material.dart';
import 'package:start_now/screens/home_screen.dart';
import 'package:start_now/screens/search_page.dart';
import 'package:start_now/screens/top_ten_page.dart';

import '../shared/themes/app_colors.dart';
import '../shared/widgets/bottom_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    const HomeScreen(),
    const SearchPage(),
    const TopTenPage()
  ];

  @override
  Widget build(BuildContext context) {
    print("$_selectedIndex ola");
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(onItemTapped: _onItemTapped, selectedIndex: _selectedIndex,),
    );
  }
}