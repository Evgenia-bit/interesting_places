import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_place_event.dart';
part 'new_place_state.dart';

const _initialState = NewPlaceState();

class NewPlaceBloc extends Bloc<NewPlaceEvent, NewPlaceState> {
  NewPlaceBloc() : super(_initialState) {
    on<NewPlaceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
