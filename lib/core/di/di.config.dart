// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:interesting_places/core/di/di.dart' as _i6;
import 'package:interesting_places/features/category/domain/repository/category_repository.dart'
    as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.CategoryRepository>(() => _i3.CategoryRepository());
    await gh.factoryAsync<_i4.Directory>(
      () => appModule.appDirectory,
      preResolve: true,
    );
    gh.lazySingleton<_i5.ImagePicker>(() => appModule.imagePicker);
    return this;
  }
}

class _$AppModule extends _i6.AppModule {}
