part of 'load_image_bloc.dart';

@immutable
class LoadImageState {
  final List<String> imagePathList;
  const LoadImageState({
    this.imagePathList = const [],
  });

  LoadImageState copyWith({
    List<String>? imagePathList,
  }) {
    return LoadImageState(
      imagePathList: imagePathList ?? this.imagePathList,
    );
  }
}
