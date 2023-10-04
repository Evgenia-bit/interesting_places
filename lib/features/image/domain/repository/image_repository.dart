import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

@Injectable()
class ImageRepository {
  const ImageRepository({
    required Directory appDirectory,
  }) : _appDirectory = appDirectory;

  final Directory _appDirectory;

  Future<String> saveImage(XFile image) async {
    final path = _appDirectory.path;
    final imageExtention = extension(image.path);
    final fileName = '${const Uuid().v4()}$imageExtention';
    await image.saveTo('$path/$fileName');
    return fileName;
  }

    Future<void> deleteImage(String fileName) async {
    final path = _appDirectory.path;
    final file = File("$path/$fileName");
    await file.delete();
  }
}
