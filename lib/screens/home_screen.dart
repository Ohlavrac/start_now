import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/trailers_movel.dart';
import '../shared/themes/app_colors.dart';
import '../shared/themes/app_texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          backgroundColor: AppColors.background,
        ),
        body: SafeArea(
          child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 20.0),
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  height: 200,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: TrailersMovie.listTrailers.length,
                      itemBuilder: (context, i) => _ItemTrailers(
                          trailers: TrailersMovie.listTrailers[i])),
                ),
                const SizedBox(height: 20.0),
                const _ItemTitle(title: 'Popular no Brasil'),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  height: 280,
                )
              ]),
        ),
      ),
    );
  }
}

class _ItemTrailers extends StatelessWidget {
  final TrailersMovie trailers;

  const _ItemTrailers({Key? key, required this.trailers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Stack(children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(trailers.image))),
          ),
          SizedBox(
              width: 300,
              child: Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.white.withOpacity(0.3),
                      child: const Icon(Icons.play_arrow_rounded,
                          color: Colors.white, size: 45)),
                ),
              )))
        ]));
  }
}

class _ItemTitle extends StatefulWidget {
  final String title;

  const _ItemTitle({Key? key, required this.title}) : super(key: key);

  @override
  State<_ItemTitle> createState() => _ItemTitleState();
}

class _ItemTitleState extends State<_ItemTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                  width: 130,
                  child: Text(
                    widget.title,
                    style: AppTexts.title,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
