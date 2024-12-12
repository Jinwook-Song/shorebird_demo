import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorebird_demo/core/core.dart';

abstract interface class PreferenceLocalDataSource {
  Future<void> setString(String key, String value);
  String getString(String key, {String defaultValue});

  Future<void> setInt(String key, int value);
  int getInt(String key, {int defaultValue});

  Future<void> setBool(String key, bool value);
  bool getBool(String key, {bool defaultValue});

  Future<void> setDouble(String key, double value);
  double getDouble(String key, {double defaultValue});

  Future<void> setStringList(String key, List<String> value);
  List<String> getStringList(String key, {List<String> defaultValue});

  Future<void> remove(String key);
  Future<void> clear();
}

class PreferenceLocalDataSourceImpl implements PreferenceLocalDataSource {
  final SharedPreferencesWithCache _pref;
  static const String _kAppPreferencePrefix = '__shorebird_demo__';

  PreferenceLocalDataSourceImpl(this._pref);

  String _prefixedKey(String key) => '$_kAppPreferencePrefix$key';

  @override
  String getString(String key, {String defaultValue = ""}) {
    return _pref.getString(_prefixedKey(key)) ?? defaultValue;
  }

  @override
  Future<void> setString(String key, String value) {
    return _pref.setString(_prefixedKey(key), value);
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return _pref.getInt(_prefixedKey(key)) ?? defaultValue;
  }

  @override
  Future<void> setInt(String key, int value) {
    return _pref.setInt(_prefixedKey(key), value);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return _pref.getBool(_prefixedKey(key)) ?? defaultValue;
  }

  @override
  Future<void> setBool(String key, bool value) {
    return _pref.setBool(_prefixedKey(key), value);
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return _pref.getDouble(_prefixedKey(key)) ?? defaultValue;
  }

  @override
  Future<void> setDouble(String key, double value) {
    return _pref.setDouble(_prefixedKey(key), value);
  }

  @override
  List<String> getStringList(
    String key, {
    List<String> defaultValue = const [],
  }) {
    return _pref.getStringList(_prefixedKey(key)) ?? defaultValue;
  }

  @override
  Future<void> setStringList(String key, List<String> value) {
    return _pref.setStringList(_prefixedKey(key), value);
  }

  @override
  Future<void> remove(String key) {
    return _pref.remove(_prefixedKey(key));
  }

  @override
  Future<void> clear() {
    return _pref.clear();
  }
}

final preferenceLocalDataSourceProvider = Provider<PreferenceLocalDataSource>(
  (ref) => PreferenceLocalDataSourceImpl(ref.read(sharedPreferencesProvider)),
);
