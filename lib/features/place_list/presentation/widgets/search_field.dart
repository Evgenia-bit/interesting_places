import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.lightGrey,
            size: 20,
          ),
          suffixIcon: IconButton(
            iconSize: 24,
            onPressed: () {},
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.zero),
            ),
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.green,
                BlendMode.srcIn,
              ),
            ),
          ),
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: AppColors.lightGrey),
          hintText: 'Поиск',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.lightestGrey,
        ),
      ),
    );
  }
}