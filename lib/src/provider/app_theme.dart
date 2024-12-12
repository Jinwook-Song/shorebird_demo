import 'package:shorebird_demo/src/di/di.dart';
import 'package:shorebird_demo/src/model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

abstract interface class AppThemeProvider {
  void toggleTheme();
}

@riverpod
class AppTheme extends _$AppTheme implements AppThemeProvider {
  @override
  AppThemeModel build() {
    return ref.watch(appThemeRepositoryProvider).getAppTheme();
  }

  @override
  void toggleTheme() {
    switch (state.theme) {
      case AppThemeMode.light:
        ref.read(appThemeRepositoryProvider).setAppTheme(
              const AppThemeModel(theme: AppThemeMode.dark),
            );
        state = state.copyWith(theme: AppThemeMode.dark);

      case AppThemeMode.dark:
        ref.read(appThemeRepositoryProvider).setAppTheme(
              const AppThemeModel(theme: AppThemeMode.light),
            );
        state = state.copyWith(theme: AppThemeMode.light);
    }
  }
}
