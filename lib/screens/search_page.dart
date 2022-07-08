import 'package:flutter/material.dart';
import 'package:start_now/shared/widgets/bottom_nav_bar.dart';
import 'package:start_now/shared/widgets/card_movie.dart';
import 'package:start_now/shared/widgets/genere_button.dart';

import '../shared/themes/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: const Color.fromARGB(192, 255, 255, 255),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 15, right: 20),
                    child: TextField(
                      onChanged: null,
                      decoration: InputDecoration(
                        suffixIconColor: Colors.white,
                        labelText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                    GenereButton(genere: 'genere', onTap: () {}),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CardMovie(
                    image: 'assets/images/thor_movie.jpg',
                    title: 'Thor: Love and Thunder',
                    date: '07-07-2022',
                    sinopsis: 'sinopsis\nsinopsis\nsinopsis\nsinopsis',
                    onDoubleTap: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CardMovie(
                    image: 'assets/images/thor_movie.jpg',
                    title: 'Thor: Love and Thunder',
                    date: '07-07-2022',
                    sinopsis: 'sinopsis\nsinopsis\nsinopsis\nsinopsis',
                    onDoubleTap: () {}),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
