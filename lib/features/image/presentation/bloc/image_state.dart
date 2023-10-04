part of 'image_bloc.dart';

@immutable
class ImageState {
  final String? addedImageFileName;
  final ImageStatus status;
  const ImageState({
    this.addedImageFileName,
    required this.status,
  });

  ImageState copyWith({
    String? addedImageFileName,
    ImageStatus? status,
  }) {
    return ImageState(
      addedImageFileName: addedImageFileName ?? this.addedImageFileName,
      status: status ?? this.status,
    );
  }
}

@immutable
sealed class ImageStatus {}

class None extends ImageStatus {}

class Added extends ImageStatus {}

class Deleted extends ImageStatus {}
