import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorebird_demo/src/model/model.dart';
import 'package:shorebird_demo/src/repository/app_theme.dart';

abstract interface class AppThemeProvider {
  void toggleTheme();
}

class AppThemeProviderImpl extends Notifier<AppThemeModel>
    implements AppThemeProvider {
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

final appThemeProvider = NotifierProvider<AppThemeProviderImpl, AppThemeModel>(
  AppThemeProviderImpl.new,
);
