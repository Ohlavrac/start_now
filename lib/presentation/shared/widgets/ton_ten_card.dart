import 'package:flutter/material.dart';
import 'package:start_now/domain/entities/movie_detail_entity.dart';
import 'package:start_now/models/movies.dart';
import '../themes/app_colors.dart';

class TopTenView extends StatelessWidget {
  final MovieEntity movie;
  final int position;

  const TopTenView({Key? key, required this.movie, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/movie_details",
            arguments: movie.id.toString());
      },
      child: Card(
        color: AppColors.colorCard,
        shape: const RoundedRectangleBorder(),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image.network(
                  "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      height: 150,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: AppColors.loadimage,
                      ),
                      child: const Center(child: Text("Carregando...")),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            "${movie.title}",
                            style: const TextStyle(
                              color: AppColors.colorBlack,
                            ),
                          ),
                        ),
                        Text(
                          '${movie.releaseDate}',
                          style: const TextStyle(
                            color: AppColors.colorBlack,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "${movie.overview}",
                            style: const TextStyle(
                              color: AppColors.colorBlack,
                            ),
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: CircleAvatar(
                        child: Text(
                          '$position',
                        ),
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
