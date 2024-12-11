// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppThemeModel _$AppThemeModelFromJson(Map<String, dynamic> json) {
  return _AppThemeModel.fromJson(json);
}

/// @nodoc
mixin _$AppThemeModel {
  AppThemeMode get theme => throw _privateConstructorUsedError;

  /// Serializes this AppThemeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppThemeModelCopyWith<AppThemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeModelCopyWith<$Res> {
  factory $AppThemeModelCopyWith(
          AppThemeModel value, $Res Function(AppThemeModel) then) =
      _$AppThemeModelCopyWithImpl<$Res, AppThemeModel>;
  @useResult
  $Res call({AppThemeMode theme});
}

/// @nodoc
class _$AppThemeModelCopyWithImpl<$Res, $Val extends AppThemeModel>
    implements $AppThemeModelCopyWith<$Res> {
  _$AppThemeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppThemeModelImplCopyWith<$Res>
    implements $AppThemeModelCopyWith<$Res> {
  factory _$$AppThemeModelImplCopyWith(
          _$AppThemeModelImpl value, $Res Function(_$AppThemeModelImpl) then) =
      __$$AppThemeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppThemeMode theme});
}

/// @nodoc
class __$$AppThemeModelImplCopyWithImpl<$Res>
    extends _$AppThemeModelCopyWithImpl<$Res, _$AppThemeModelImpl>
    implements _$$AppThemeModelImplCopyWith<$Res> {
  __$$AppThemeModelImplCopyWithImpl(
      _$AppThemeModelImpl _value, $Res Function(_$AppThemeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_$AppThemeModelImpl(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppThemeMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppThemeModelImpl extends _AppThemeModel {
  const _$AppThemeModelImpl({this.theme = AppThemeMode.light}) : super._();

  factory _$AppThemeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppThemeModelImplFromJson(json);

  @override
  @JsonKey()
  final AppThemeMode theme;

  @override
  String toString() {
    return 'AppThemeModel(theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppThemeModelImpl &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, theme);

  /// Create a copy of AppThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppThemeModelImplCopyWith<_$AppThemeModelImpl> get copyWith =>
      __$$AppThemeModelImplCopyWithImpl<_$AppThemeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppThemeModelImplToJson(
      this,
    );
  }
}

abstract class _AppThemeModel extends AppThemeModel {
  const factory _AppThemeModel({final AppThemeMode theme}) =
      _$AppThemeModelImpl;
  const _AppThemeModel._() : super._();

  factory _AppThemeModel.fromJson(Map<String, dynamic> json) =
      _$AppThemeModelImpl.fromJson;

  @override
  AppThemeMode get theme;

  /// Create a copy of AppThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppThemeModelImplCopyWith<_$AppThemeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
