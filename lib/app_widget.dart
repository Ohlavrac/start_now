import 'package:flutter/material.dart';
import 'package:start_now/screens/movie_details.dart';

import 'screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Start Now",
      debugShowCheckedModeBanner: false,
      initialRoute: "/movie_details",
      routes: {
        "/home": (context) => Home(),
        "/movie_details": (context) => MovieDetails()
      },
    );
  }
}