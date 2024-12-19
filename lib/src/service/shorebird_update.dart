import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

abstract interface class ShorebirdHelperService {
  Future<bool> update();
}

class ShorebirdHelperServiceImpl implements ShorebirdHelperService {
  static const _retry = 5;
  int _retryCount = 0;
  final ShorebirdUpdater _updater;

  ShorebirdHelperServiceImpl(this._updater);

  bool get _updateAvailable => _updater.isAvailable;

  Future<Patch?> _readCurrentPatch() {
    return _updater.readCurrentPatch();
  }

  Future<Patch?> _readNextPatch() {
    return _updater.readNextPatch();
  }

  Future<UpdateStatus> _checkForUpdate() {
    return _updater.checkForUpdate();
  }

  Future<void> _update() async {
    while (_retryCount < _retry) {
      try {
        await _updater.update();
        return;
      } on UpdateException catch (e) {
        if (e.reason == UpdateFailureReason.downloadFailed ||
            e.reason == UpdateFailureReason.installFailed) {
          _retryCount++;
          continue;
        }
        print(e.message);
        return;
      }
    }
  }

  @override
  Future<bool> update() async {
    if (!_updateAvailable) return false;
    final status = await _checkForUpdate();
    Patch? currentPatch, nextPatch;
    currentPatch = await _readCurrentPatch();
    nextPatch = await _readNextPatch();

    print('patch: $currentPatch, $nextPatch');

    switch (status) {
      /// 최신버전
      case UpdateStatus.upToDate:

      /// 업데이트 가능
      case UpdateStatus.outdated:
        await _update();

      /// 업데이트 준비됨
      case UpdateStatus.restartRequired:
        return true;

      /// 업데이트 불가능
      case UpdateStatus.unavailable:
    }

    return false;
  }
}

final shorebirServiceProvider = Provider<ShorebirdHelperService>(
  (ref) => ShorebirdHelperServiceImpl(ShorebirdUpdater()),
);
