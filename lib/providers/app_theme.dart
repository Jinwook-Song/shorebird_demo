import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shorebird_demo/model/app_theme_model.dart';

part 'app_theme.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  @override
  AppThemeModel build() {
    return const AppThemeModel();
  }

  toggleTheme() {
    final AppThemeMode currentTheme = state.theme;
    switch (currentTheme) {
      case AppThemeMode.light:
        state = state.copyWith(theme: AppThemeMode.dark);

      case AppThemeMode.dark:
        state = state.copyWith(theme: AppThemeMode.light);
    }
  }
}
