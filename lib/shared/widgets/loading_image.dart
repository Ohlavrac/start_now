import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class LoadingImage extends StatelessWidget {
  final double height;
  final double width;
  const LoadingImage({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.loadimage,
      height: height,
      width: width,
      child: const Center(child: Text("Carregando...")),
    );
  }
}
