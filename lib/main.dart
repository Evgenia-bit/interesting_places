import 'package:flutter/material.dart';
import 'package:interesting_places/core/app/app.dart';
import 'package:interesting_places/core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp( App());
}