// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppThemeModelImpl _$$AppThemeModelImplFromJson(Map<String, dynamic> json) =>
    _$AppThemeModelImpl(
      theme: $enumDecodeNullable(_$AppThemeModeEnumMap, json['theme']) ??
          AppThemeMode.light,
    );

Map<String, dynamic> _$$AppThemeModelImplToJson(_$AppThemeModelImpl instance) =>
    <String, dynamic>{
      'theme': _$AppThemeModeEnumMap[instance.theme]!,
    };

const _$AppThemeModeEnumMap = {
  AppThemeMode.light: 'light',
  AppThemeMode.dark: 'dark',
};
