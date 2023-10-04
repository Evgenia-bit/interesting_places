import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interesting_places/core/di/di.dart';
import 'package:interesting_places/features/image/domain/repository/image_repository.dart';
import 'package:interesting_places/features/image/presentation/bloc/image_bloc.dart';
import 'package:provider/single_child_widget.dart';

class ImageModule extends SingleChildStatelessWidget {
  const ImageModule({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider(
        create: (_) => ImageBloc(
          picker: getIt<ImagePicker>(),
          repository: getIt<ImageRepository>(),
        ),
        child: child,
      );
}
