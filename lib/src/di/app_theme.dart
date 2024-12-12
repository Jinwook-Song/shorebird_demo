import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorebird_demo/core/core.dart';
import 'package:shorebird_demo/src/repository/app_theme.dart';
import 'package:shorebird_demo/src/service/app_theme.dart';
import 'package:shorebird_demo/src/source/local/preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

// Source
@riverpod
PreferenceLocalDataSource preferenceLocalDataSource(Ref ref) {
  return PreferenceLocalDataSourceImpl(ref.read(sharedPreferencesProvider));
}

// Service
@riverpod
AppThemeService appThemeService(Ref ref) {
  return AppThemeServiceImpl(ref.read(preferenceLocalDataSourceProvider));
}

// Repository
@riverpod
AppThemeRepository appThemeRepository(Ref ref) {
  return AppThemeRepositoryImpl(ref.read(appThemeServiceProvider));
}
