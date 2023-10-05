part of 'image_bloc.dart';

@immutable
class ImageState {
  final String? addedFileName;
  final AddImageStatus status;

  const ImageState({ this.status = AddImageStatus.none, this.addedFileName});

  ImageState copyWith({String? addedFileName, AddImageStatus? status}) {
    return ImageState(
      addedFileName: addedFileName ?? this.addedFileName,
      status: status ?? this.status,
    );
  }
}

enum AddImageStatus { none, added, deleted }
