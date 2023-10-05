part of 'image_bloc.dart';

@immutable
class ImageState {
  final List<String> pathList;
  const ImageState({
    this.pathList = const [],
  });

  ImageState copyWith({
    List<String>? pathList,
  }) {
    return ImageState(
      pathList: pathList ?? this.pathList,
    );
  }
}
