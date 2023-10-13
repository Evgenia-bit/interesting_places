import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/features/get_current_position/presentation/bloc/get_current_position_bloc.dart';
import 'package:latlong2/latlong.dart';

class CurrentPositionButton extends StatelessWidget {
  const CurrentPositionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 48,
          width: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                context
                    .read<GetCurrentPositionBloc>()
                    .add(GetCurrentPositionEvent());
              },
              iconSize: 24,
              icon: Transform.rotate(
                angle: pi / 4,
                child:  Icon(
                  Icons.navigation,
                  color: colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
