import 'package:flutter/material.dart';
import 'package:start_now/controllers/verify_image.dart';
import '../../models/movies.dart';
import '../themes/app_colors.dart';
import '../themes/app_texts.dart';

class RecommendedMoviesCard extends StatelessWidget {
  final Results resultsMovies;

  const RecommendedMoviesCard({Key? key, required this.resultsMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyImage verifyImage = VerifyImage();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/movie_details",
            arguments: resultsMovies.id.toString());
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              verifyImage.verifyImage(resultsMovies.backdropPath.toString()),
              height: 150,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  color: AppColors.loadimage,
                  height: 150,
                  width: 250,
                  child: const Center(child: Text("Carregando...")),
                );
              },
            ),
          ),
          SizedBox(
              width: 250,
              child: Text(
                "${resultsMovies.title}",
                style: AppTexts.title,
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }
}
