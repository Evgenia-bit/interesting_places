import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/widgets/image_gallery.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';

@RoutePage()
class PlaceDetailsScreen extends StatelessWidget {
  final PlaceEntity place;
  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight / 2,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    useSafeArea: false,
                    builder: (context) {
                      return ImageGallery(
                        imageList: place.imageList,
                      );
                    },
                  );
                },
                child: place.imageList.length > 1
                    ? ImageCarousel(imageList: place.imageList)
                    : SingleImage(imageData: place.imageList.first),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    place.category.name,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    place.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleImage extends StatelessWidget {
  final Uint8List imageData;
  const SingleImage({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.memory(
          imageData,
          fit: BoxFit.cover,
        ),
        const Positioned(top: 36, left: 16, child: _BackButton()),
      ],
    );
  }
}

class ImageCarousel extends StatefulWidget {
  final List<Uint8List> imageList;
  const ImageCarousel({super.key, required this.imageList});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final _controller = PageController();
  double _screenWidth = 0;
  double _pageIndicatorWidth = 0;
  double _indicatorPositionLeft = 0;

  @override
  void didChangeDependencies() {
    _screenWidth = MediaQuery.of(context).size.width;
    _pageIndicatorWidth = _screenWidth / widget.imageList.length;
    _controller.addListener(() {
      setState(() {
        _indicatorPositionLeft = _controller.page! * _pageIndicatorWidth;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          children: widget.imageList
              .map(
                (data) => Image.memory(
                  data,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
        Positioned(
          bottom: 0,
          left: _indicatorPositionLeft,
          child: SizedBox(
            height: 8,
            width: _pageIndicatorWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const Positioned(top: 36, left: 16, child: _BackButton()),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: () => context.router.pop(),
      style: ButtonStyle(
        maximumSize: const MaterialStatePropertyAll(Size(32, 32)),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        // backgroundColor: const MaterialStatePropertyAll(colorScheme.background),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Icon(
        Icons.arrow_back_ios,
        size: 15,
        color: colorScheme.tertiary,
      ),
    );
  }
}
