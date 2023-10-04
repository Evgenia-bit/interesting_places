

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'load_image_event.dart';
part 'load_image_state.dart';

class LoadImageBloc extends Bloc<LoadImageEvent, LoadImageState> {
  LoadImageBloc() : super(const LoadImageState()) {
    on<LoadImageEvent>((event, emit) {
      
    });

    _handleLoadImage() {
      
    }
  }
}
