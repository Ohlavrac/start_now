import 'package:flutter/material.dart';

import 'presentation/providers/movies_providers.dart';
import 'presentation/screens/home.dart';
import 'presentation/screens/movie_details.dart';
import 'presentation/screens/search_page.dart';
import 'presentation/screens/top_ten_page.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoviesProviders()),
      ],
      child: MaterialApp(
        title: "Start Now",
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        routes: {
          "/home": (context) => const Home(),
          "/movie_details": (context) => const MovieDetails(),
          "/search_page": (context) => const SearchPage(),
          "/top10": (context) => const TopTenPage()
        },
      ),
    );
  }
}
