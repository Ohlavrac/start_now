import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class GenereButton extends StatelessWidget {
  final String genere;
  final void Function() onTap;
  const GenereButton({Key? key, required this.genere, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 40,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: AppColors.colorGenereButton,
        ),
        child: Text(
          genere,
          style: const TextStyle(fontSize: 10.0),
        ),
      ),
    );
  }
}
