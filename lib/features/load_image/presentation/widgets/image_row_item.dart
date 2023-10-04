import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class ImageRowItem extends StatelessWidget {
  const ImageRowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/photo_1.png'),
        ),
      ),
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {},
        child: Transform.rotate(
          angle: pi / 4,
          child: const Icon(
            Icons.add_circle,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
