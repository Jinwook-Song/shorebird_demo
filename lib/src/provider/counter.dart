import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shorebird_demo/src/model/counter_model.dart';
import 'package:shorebird_demo/src/provider/provider.dart';

part 'counter.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  final _counterModel = CounterModel.initial();
  StreamSubscription<int>? _subscription;

  @override
  Stream<CounterModel> build() async* {
    yield _counterModel;
    _startCounting();

    ref.onDispose(() {
      _stopCounting();
    });
  }

  void _startCounting() {
    _stopCounting();
    if (!_counterModel.isPlay) return;

    _subscription =
        Stream.periodic(const Duration(seconds: 1), (count) => count)
            .listen((_) {
      final isPositive = !ref.watch(appThemeProvider).isDefaultTheme;
      _counterModel.count =
          isPositive ? _counterModel.count + 1 : _counterModel.count - 1;
      state = AsyncValue.data(_counterModel);
    });
  }

  void _stopCounting() {
    _subscription?.cancel();
    _subscription = null;
  }

  void togglePlay() {
    _counterModel.isPlay = !_counterModel.isPlay;
    if (_counterModel.isPlay) {
      if (_subscription == null) {
        _startCounting();
      } else {
        _subscription?.resume();
      }
    } else {
      _subscription?.pause();
    }
    state = AsyncValue.data(_counterModel);
  }

  void reset() {
    _counterModel.count = 0;
    _startCounting();
    state = AsyncValue.data(_counterModel);
  }
}
