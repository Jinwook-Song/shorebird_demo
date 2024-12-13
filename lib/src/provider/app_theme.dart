import 'package:shorebird_demo/src/di/di.dart';
import 'package:shorebird_demo/src/model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

abstract interface class AppThemeProvider {
  void setLightTheme();
  void setDarkTheme();
  void toggleTheme();
}

@riverpod
class AppTheme extends _$AppTheme implements AppThemeProvider {
  @override
  AppThemeModel build() {
    return ref.watch(appThemeRepositoryProvider).getAppTheme();
  }

  @override
  void setLightTheme() {
    if (state.theme == AppThemeMode.light) return;
    ref.read(appThemeRepositoryProvider).setAppTheme(AppThemeModel.light());
    state = state.copyWith(theme: AppThemeMode.light);
  }

  @override
  void setDarkTheme() {
    if (state.theme == AppThemeMode.dark) return;
    ref.read(appThemeRepositoryProvider).setAppTheme(AppThemeModel.dark());
    state = state.copyWith(theme: AppThemeMode.dark);
  }

  @override
  void toggleTheme() {
    switch (state.theme) {
      case AppThemeMode.light:
        setDarkTheme();
      case AppThemeMode.dark:
        setLightTheme();
    }
  }
}
