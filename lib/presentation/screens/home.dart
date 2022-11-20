import 'package:flutter/material.dart';
import '../shared/widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'search_page.dart';
import 'top_ten_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
      bottomNavigationBar: MyBottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
