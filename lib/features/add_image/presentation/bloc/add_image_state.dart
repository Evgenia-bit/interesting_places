part of 'add_image_bloc.dart';

@immutable
class AddImageState {
  final String? path;
  final AddImageStatus status;

  const AddImageState({ this.status = AddImageStatus.none, this.path});

  AddImageState copyWith({String? path, AddImageStatus? status}) {
    return AddImageState(
      path: path ?? this.path,
      status: status ?? this.status,
    );
  }
}

enum AddImageStatus { none, added, deleted }
