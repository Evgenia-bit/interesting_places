import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:interesting_places/features/image/domain/repository/image_repository.dart';

part 'image_event.dart';
part 'image_state.dart';

const _initialState = ImageState();

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc({
    required ImagePicker picker,
    required ImageRepository repository,
  })  : _picker = picker,
        _repository = repository,
        super(_initialState) {
    on<AddImageEvent>(_handleAddImage, transformer: droppable());
    on<DeleteImageEvent>(_handleDeleteImage, transformer: droppable());
  }

  final ImagePicker _picker;
  final ImageRepository _repository;

  Future<void> _handleAddImage(
    AddImageEvent event,
    Emitter<ImageState> emit,
  ) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final fileName = await _repository.saveImage(image);
      emit(state.copyWith(fileNameList: [...state.fileNameList, fileName]));
    }
  }

  Future<void> _handleDeleteImage(
    DeleteImageEvent event,
    Emitter<ImageState> emit,
  ) async {
    await _repository.deleteImage(event.fileName);
    final fileNameList = state.fileNameList;
    fileNameList.remove(event.fileName);
    emit(state.copyWith(fileNameList: fileNameList));
  }
}