import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:interesting_places/features/get_current_position/domain/repository/get_current_position_repository.dart';

part 'get_current_position_event.dart';
part 'get_current_position_state.dart';

const _initialState = GetCurrentPositionState();

//по умолчанию координаты соответствуют центру Москвы
const _defaultState = GetCurrentPositionState(
  latitude: 55.75482,
  longitude: 37.62169,
  errorMessage: '',
  status: GetCurrentPositionStatus.none,
);

class GetCurrentPositionBloc
    extends Bloc<GetCurrentPositionEvent, GetCurrentPositionState> {
  GetCurrentPositionBloc({
    required PositionRepository repository,
  })  : _repository = repository,
        super(_initialState) {
    on<GetCurrentPositionEvent>(_handleGetCurrentPosition);
  }

  final PositionRepository _repository;

  Future<void> _handleGetCurrentPosition(
    GetCurrentPositionEvent _,
    Emitter<GetCurrentPositionState> emit,
  ) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const GetCurrentPositionState(
        status: GetCurrentPositionStatus.failed,
        errorMessage: 'Служба определения местоположения отключена',
      ));
      emit(_defaultState);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      emit(const GetCurrentPositionState(
        status: GetCurrentPositionStatus.failed,
        errorMessage: 'Нет разрешения на доступ к местоположению устройства',
      ));
      emit(_defaultState);
      return;
    }

    final position = await _repository.getCurrentPosition();

    emit(GetCurrentPositionState(
      latitude: position?.latitude,
      longitude: position?.longitude,
      status: GetCurrentPositionStatus.success,
    ));

    emit(state.copyWith(status: GetCurrentPositionStatus.none));
  }
}
