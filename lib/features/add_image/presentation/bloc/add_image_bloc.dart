import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'add_image_event.dart';
part 'add_image_state.dart';

const _initialState = AddImageState();

class AddImageBloc extends Bloc<ImageEvent, AddImageState> {
  AddImageBloc({
    required ImagePicker picker,
  })  : _picker = picker,
        super(_initialState) {
    on<AddImageEvent>(_handleAddImage, transformer: droppable());
  }

  final ImagePicker _picker;

  Future<void> _handleAddImage(
    AddImageEvent event,
    Emitter<AddImageState> emit,
  ) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(status: AddImageStatus.added, path: image.path));
      emit(state.copyWith(status: AddImageStatus.none));
    }
  }

}
