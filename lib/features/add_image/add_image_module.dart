import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interesting_places/core/di/di.dart';
import 'package:interesting_places/features/add_image/presentation/bloc/add_image_bloc.dart';
import 'package:provider/single_child_widget.dart';

class AddImageModule extends SingleChildStatelessWidget {
  const AddImageModule({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider(
        create: (_) => AddImageBloc(
          picker: getIt<ImagePicker>(),
        ),
        child: child,
      );
}
