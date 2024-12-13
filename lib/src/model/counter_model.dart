import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_model.freezed.dart';
part 'counter_model.g.dart';

@unfreezed
class CounterModel with _$CounterModel {
  factory CounterModel({
    required int count,
    required bool isPlay,
  }) = _CounterModel;

  factory CounterModel.initial() {
    return CounterModel(count: 0, isPlay: true);
  }

  factory CounterModel.fromJson(Map<String, dynamic> json) =>
      _$CounterModelFromJson(json);
}
