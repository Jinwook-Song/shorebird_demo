import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class UpdateHandler extends StatefulWidget {
  const UpdateHandler({super.key});

  @override
  State<UpdateHandler> createState() => _UpdateHandlerState();
}

class _UpdateHandlerState extends State<UpdateHandler> {
  final ShorebirdUpdater _updater = ShorebirdUpdater();

  Patch? _currentPatch, _nextPatch;
  String? _updateError;
  String? _readPatchError;
  UpdateFailureReason? _errorReason;

  bool get _updateAvailable => _updater.isAvailable;

  void _readCurrentPatch() async {
    try {
      _currentPatch = await _updater.readCurrentPatch();
      setState(() {
        _readPatchError = null;
      });
    } on ReadPatchException catch (error) {
      setState(() {
        _readPatchError = error.message;
      });
    }
  }

  void _readNextPatch() async {
    try {
      _nextPatch = await _updater.readNextPatch();
      setState(() {
        _readPatchError = null;
      });
    } on ReadPatchException catch (error) {
      setState(() {
        _readPatchError = error.message;
      });
    }
  }

  void _update() async {
    try {
      await _updater.update();
      setState(() {
        _updateError = null;
        _errorReason = null;
      });
    } on UpdateException catch (error) {
      _updateError = error.message;
      _errorReason = error.reason;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _updateAvailable ? () {} : null,
          child: const Text('Shorebird Support'),
        ),
        if (_updateAvailable) ...[
          ElevatedButton(
            onPressed: _readCurrentPatch,
            child: Text(_currentPatch?.number.toString() ?? '-'),
          ),
          ElevatedButton(
            onPressed: _readNextPatch,
            child: Text(_nextPatch?.number.toString() ?? '-'),
          ),
        ],
        if (_updateError != null) ...[
          Column(
            children: [
              const Gap(10),
              const Text('Update Error'),
              Text(_updateError!),
              Text(_errorReason!.name),
            ],
          ),
        ],
        if (_readPatchError != null) Text(_readPatchError!),
        const Gap(10),
        FutureBuilder(
          future: _updater.checkForUpdate(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            }

            switch (snapshot.data!) {
              case UpdateStatus.upToDate:
                return const Text('최신 버전');
              case UpdateStatus.outdated:
                return Column(
                  children: [
                    const Text('업데이트 가능'),
                    ElevatedButton(
                      onPressed: _update,
                      child: const Text('업데이트'),
                    ),
                  ],
                );
              case UpdateStatus.restartRequired:
                return Column(
                  children: [
                    const Text('업데이트 가능'),
                    ElevatedButton(
                      onPressed: _update,
                      child: const Text('업데이트 준비됨'),
                    ),
                  ],
                );
              case UpdateStatus.unavailable:
                return const Text('업데이트 불가');
            }
          },
        ),
      ],
    );
  }
}
