import 'package:flutter/material.dart';
import 'package:interesting_places/features/add_image/presentation/widgets/add_image_button.dart';
import 'package:interesting_places/features/add_image/presentation/widgets/image_row_item.dart';

class ImageRow extends StatelessWidget {
  const ImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      const ImageRowItem(),
      const ImageRowItem(),
      const ImageRowItem(),
      const ImageRowItem(),
      const ImageRowItem(),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SizedBox(
        height: 72,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: items.length + 1,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return const AddImageButton();
            }
            return items[index - 1];
          },
        ),
      ),
    );
  }
}
