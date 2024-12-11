import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_model.freezed.dart';
part 'app_theme_model.g.dart';

@freezed
class AppThemeModel with _$AppThemeModel {
  const AppThemeModel._();
  const factory AppThemeModel({
    @Default(AppThemeMode.light) AppThemeMode theme,
  }) = _AppThemeModel;

  ThemeMode get themeMode =>
      theme == AppThemeMode.light ? ThemeMode.light : ThemeMode.dark;

  bool get isDefaultTheme => theme == AppThemeMode.light;

  factory AppThemeModel.fromJson(Map<String, dynamic> json) =>
      _$AppThemeModelFromJson(json);
}

enum AppThemeMode {
  light,
  dark,
}
