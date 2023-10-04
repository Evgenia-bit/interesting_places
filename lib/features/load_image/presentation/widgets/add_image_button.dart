import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 2,
            color: AppColors.lightGreen,
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 40,
          color: AppColors.green,
        ),
      ),
    );
  }
}
