import 'package:flutter/material.dart';
import 'package:start_now/shared/themes/app_colors.dart';

class MyBottomNavBar extends StatefulWidget {
  final void Function(int value)? onItemTapped;
  final int selectedIndex;
  const MyBottomNavBar(
      {Key? key, required this.onItemTapped, required this.selectedIndex})
      : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.colorBlack,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.colorIcon,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: AppColors.colorWhite,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: AppColors.colorIcon,
            ),
            label: 'Search',
            activeIcon: Icon(
              Icons.search,
              color: AppColors.colorWhite,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rocket_launch_outlined,
              color: AppColors.colorIcon,
            ),
            label: 'Top10',
            activeIcon: Icon(
              Icons.rocket_launch_outlined,
              color: AppColors.colorWhite,
            ),
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: widget.onItemTapped,
      ),
    );
  }
}
