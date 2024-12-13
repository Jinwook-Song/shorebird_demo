// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounterModelImpl _$$CounterModelImplFromJson(Map<String, dynamic> json) =>
    _$CounterModelImpl(
      count: (json['count'] as num).toInt(),
      isPlay: json['isPlay'] as bool,
    );

Map<String, dynamic> _$$CounterModelImplToJson(_$CounterModelImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'isPlay': instance.isPlay,
    };
