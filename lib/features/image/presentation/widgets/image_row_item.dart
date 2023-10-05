import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/image/presentation/bloc/image_bloc.dart';

class ImageRowItem extends StatelessWidget {
  final String path;

  const ImageRowItem({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    final file = File(path);

    return SizedBox(
      height: 72,
      width: 72,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: FileImage(file),
            fit: BoxFit.cover,
          ),
        ),
        child: TextButton(
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(3)),
          ),
          onPressed: () {
            context.read<ImageBloc>().add(DeleteImageEvent(path: path));
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Transform.rotate(
              angle: pi / 4,
              child: const Icon(
                Icons.add_circle,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
