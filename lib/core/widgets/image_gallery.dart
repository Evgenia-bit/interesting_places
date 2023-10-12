import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ImageGallery extends StatefulWidget {
  final List<Uint8List> imageList;
  const ImageGallery({super.key, required this.imageList});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _currentPage = 1;
  final _controller = PageController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.page != null) {
        setState(() {
          _currentPage = _controller.page!.round() + 1;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '$_currentPage/${widget.imageList.length}',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.tertiary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: Icon(
              Icons.close,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Center(
        child: PageView(
          controller: _controller,
          children: widget.imageList
              .map(
                (data) => Image.memory(
                  data,
                  fit: BoxFit.contain,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
