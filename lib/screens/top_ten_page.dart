import 'package:flutter/material.dart';

import '../shared/themes/app_colors.dart';
import '../shared/widgets/top_ten_list.dart';

class TopTenPage extends StatefulWidget {
  const TopTenPage({Key? key}) : super(key: key);

  @override
  State<TopTenPage> createState() => _TopTenPageState();
}

class _TopTenPageState extends State<TopTenPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Top10 of Community: '),
          ),
          backgroundColor: AppColors.background,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TopTenView(),
          ),
        ),
      ),
    );
  }
}
