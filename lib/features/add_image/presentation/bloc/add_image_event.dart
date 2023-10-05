part of 'add_image_bloc.dart';

@immutable
sealed class ImageEvent {}

class AddImageEvent extends ImageEvent {}

class DeleteImageEvent extends ImageEvent {
  DeleteImageEvent({required this.path});

  final String path;
}
