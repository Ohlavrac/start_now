import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String sinopsis;
  final void Function() onDoubleTap;

  const CardMovie(
      {Key? key,
      required this.image,
      required this.title,
      required this.date,
      required this.sinopsis,
      required this.onDoubleTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Card(
        color: const Color.fromRGBO(85, 85, 85, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      sinopsis,
                      style: const TextStyle(
                        color: Colors.white,
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
