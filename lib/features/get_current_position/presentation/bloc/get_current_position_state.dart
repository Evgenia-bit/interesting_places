part of 'get_current_position_bloc.dart';

@immutable
class GetCurrentPositionState {
  const GetCurrentPositionState({
    this.status = GetCurrentPositionStatus.none,
    this.errorMessage,
    this.latitude,
    this.longitude,
  });

  final double? latitude;
  final double? longitude;
  final GetCurrentPositionStatus status;
  final String? errorMessage;
  GetCurrentPositionState copyWith({
    double? latitude,
    double? longitude,
    GetCurrentPositionStatus? status,
    String? errorMessage,
  }) {
    return GetCurrentPositionState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum GetCurrentPositionStatus {
  none,
  success,
  failed,
}
