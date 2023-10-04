import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/image/presentation/bloc/image_bloc.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: 72,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 2,
            color: AppColors.lightGreen,
          ),
        ),
        child: TextButton(
          onPressed: () {
            context.read<ImageBloc>().add(AddImageEvent());
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}