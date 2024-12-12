import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorebird_demo/src/model/model.dart';
import 'package:shorebird_demo/src/service/service.dart';

abstract interface class AppThemeRepository {
  AppThemeModel getAppTheme();
  Future<void> setAppTheme(AppThemeModel appTheme);
}

class AppThemeRepositoryImpl implements AppThemeRepository {
  final AppThemeService _appThemeService;

  AppThemeRepositoryImpl(this._appThemeService);

  @override
  AppThemeModel getAppTheme() {
    return AppThemeModel.fromJson({'theme': _appThemeService.getTheme()});
  }

  @override
  Future<void> setAppTheme(AppThemeModel appTheme) {
    return _appThemeService.setTheme(appTheme: appTheme.theme.name);
  }
}

final appThemeRepositoryProvider = Provider<AppThemeRepository>(
  (ref) => AppThemeRepositoryImpl(ref.read(appThemeServiceProvider)),
);
