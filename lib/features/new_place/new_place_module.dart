import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/features/new_place/presentation/bloc/new_place_bloc.dart';
import 'package:provider/single_child_widget.dart';

class NewPlaceModule extends SingleChildStatelessWidget {
  const NewPlaceModule({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider(
        create: (_) => NewPlaceBloc(),
        child: child,
      );
}
