import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/features/get_current_position/presentation/bloc/get_current_position_bloc.dart';
import 'package:provider/single_child_widget.dart';

class GetCurrentPositionModule extends SingleChildStatelessWidget {
  const GetCurrentPositionModule({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider(
        create: (_) =>  GetCurrentPositionBloc(),
        child: child,
      );
}
