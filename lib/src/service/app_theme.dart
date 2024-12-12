import 'package:shorebird_demo/src/source/source.dart';

abstract interface class AppThemeService {
  /// Default: light
  String getTheme();
  Future<void> setTheme({required String appTheme});
}

class AppThemeServiceImpl implements AppThemeService {
  final PreferenceLocalDataSource _preferenceLocalDataSource;

  AppThemeServiceImpl(this._preferenceLocalDataSource);

  static const _kAppThemeKey = 'appTheme';
  static const _kDefaultAppTheme = 'light';

  @override
  String getTheme() {
    return _preferenceLocalDataSource.getString(
      _kAppThemeKey,
      defaultValue: _kDefaultAppTheme,
    );
  }

  @override
  Future<void> setTheme({required String appTheme}) {
    return _preferenceLocalDataSource.setString(_kAppThemeKey, appTheme);
  }
}
