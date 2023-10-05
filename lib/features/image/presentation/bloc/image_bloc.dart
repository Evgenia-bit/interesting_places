import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'image_event.dart';
part 'image_state.dart';

const _initialState = ImageState();

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc({
    required ImagePicker picker,
  })  : _picker = picker,
        super(_initialState) {
    on<AddImageEvent>(_handleAddImage, transformer: droppable());
    on<DeleteImageEvent>(_handleDeleteImage, transformer: droppable());
  }

  final ImagePicker _picker;

  Future<void> _handleAddImage(
    AddImageEvent event,
    Emitter<ImageState> emit,
  ) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(pathList: [...state.pathList, image.path]));
    }
  }

  Future<void> _handleDeleteImage(
    DeleteImageEvent event,
    Emitter<ImageState> emit,
  ) async {
    final pathList = state.pathList;
    pathList.remove(event.path);
    emit(state.copyWith(pathList: pathList));
  }
}
