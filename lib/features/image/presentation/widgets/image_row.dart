import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/features/image/presentation/bloc/image_bloc.dart';
import 'package:interesting_places/features/image/presentation/widgets/add_image_button.dart';
import 'package:interesting_places/features/image/presentation/widgets/image_row_item.dart';

class ImageRow extends StatelessWidget {
  const ImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    final pathList = context.watch<ImageBloc>().state.pathList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SizedBox(
        height: 72,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: pathList.length + 1,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return const AddImageButton();
            }
            return ImageRowItem(
              path: pathList[index - 1],
            );
          },
        ),
      ),
    );
  }
}
