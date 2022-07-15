import 'package:flutter/material.dart';
import 'package:start_now/screens/movie_details.dart';
import 'package:start_now/screens/search_page.dart';
import 'package:start_now/screens/top_ten_page.dart';

import 'screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Start Now",
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Home(),
        "/movie_details": (context) => const MovieDetails(),
        "/search_page": (context) => const SearchPage(),
        "/top10": (context) => const TopTenPage()
      },
    );
  }
}