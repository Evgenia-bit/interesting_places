import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:interesting_places/core/data/database/database.dart';
import 'package:path_provider/path_provider.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class AppModule {
  @preResolve
  Future<Directory> get appDirectory => getApplicationDocumentsDirectory();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();
}
