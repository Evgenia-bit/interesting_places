part of 'image_bloc.dart';

@immutable
class ImageState {
  final List<String> fileNameList;
  const ImageState({
    this.fileNameList = const [],
  });

  ImageState copyWith({
    List<String>? fileNameList,
  }) {
    return ImageState(
      fileNameList: fileNameList ?? this.fileNameList,
    );
  }
}
