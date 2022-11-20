import 'package:flutter/material.dart';
import 'package:start_now/controllers/verify_image.dart';

import '../../../models/search_movie.dart';
import '../themes/app_colors.dart';
import 'loading_image.dart';

class CardMovie extends StatelessWidget {
  final ResultsMovieSearch resultsMovieSearch;

  const CardMovie({
    Key? key,
    required this.resultsMovieSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyImage verifyImage = VerifyImage();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/movie_details",
            arguments: resultsMovieSearch.id.toString());
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: AppColors.colorWhite,
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Row(
            children: [
              ClipRRect(
                child: Image.network(
                  verifyImage
                      .verifyImage(resultsMovieSearch.posterPath.toString()),
                  height: 150,
                  width: 100,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const LoadingImage(
                      height: 150,
                      width: 100,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        "${resultsMovieSearch.title}",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "${resultsMovieSearch.releaseDate}",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 210,
                      child: Text(
                        "${resultsMovieSearch.overview}",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
