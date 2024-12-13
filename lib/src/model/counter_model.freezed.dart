// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CounterModel _$CounterModelFromJson(Map<String, dynamic> json) {
  return _CounterModel.fromJson(json);
}

/// @nodoc
mixin _$CounterModel {
  int get count => throw _privateConstructorUsedError;
  set count(int value) => throw _privateConstructorUsedError;
  bool get isPlay => throw _privateConstructorUsedError;
  set isPlay(bool value) => throw _privateConstructorUsedError;

  /// Serializes this CounterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CounterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounterModelCopyWith<CounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterModelCopyWith<$Res> {
  factory $CounterModelCopyWith(
          CounterModel value, $Res Function(CounterModel) then) =
      _$CounterModelCopyWithImpl<$Res, CounterModel>;
  @useResult
  $Res call({int count, bool isPlay});
}

/// @nodoc
class _$CounterModelCopyWithImpl<$Res, $Val extends CounterModel>
    implements $CounterModelCopyWith<$Res> {
  _$CounterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? isPlay = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isPlay: null == isPlay
          ? _value.isPlay
          : isPlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterModelImplCopyWith<$Res>
    implements $CounterModelCopyWith<$Res> {
  factory _$$CounterModelImplCopyWith(
          _$CounterModelImpl value, $Res Function(_$CounterModelImpl) then) =
      __$$CounterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, bool isPlay});
}

/// @nodoc
class __$$CounterModelImplCopyWithImpl<$Res>
    extends _$CounterModelCopyWithImpl<$Res, _$CounterModelImpl>
    implements _$$CounterModelImplCopyWith<$Res> {
  __$$CounterModelImplCopyWithImpl(
      _$CounterModelImpl _value, $Res Function(_$CounterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CounterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? isPlay = null,
  }) {
    return _then(_$CounterModelImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isPlay: null == isPlay
          ? _value.isPlay
          : isPlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounterModelImpl implements _CounterModel {
  _$CounterModelImpl({required this.count, required this.isPlay});

  factory _$CounterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounterModelImplFromJson(json);

  @override
  int count;
  @override
  bool isPlay;

  @override
  String toString() {
    return 'CounterModel(count: $count, isPlay: $isPlay)';
  }

  /// Create a copy of CounterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterModelImplCopyWith<_$CounterModelImpl> get copyWith =>
      __$$CounterModelImplCopyWithImpl<_$CounterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounterModelImplToJson(
      this,
    );
  }
}

abstract class _CounterModel implements CounterModel {
  factory _CounterModel({required int count, required bool isPlay}) =
      _$CounterModelImpl;

  factory _CounterModel.fromJson(Map<String, dynamic> json) =
      _$CounterModelImpl.fromJson;

  @override
  int get count;
  set count(int value);
  @override
  bool get isPlay;
  set isPlay(bool value);

  /// Create a copy of CounterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounterModelImplCopyWith<_$CounterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
