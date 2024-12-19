import 'package:flutter/services.dart';

class AndroidChannel {
  static const _platform = MethodChannel('com.example.shorebird_demo/channel');

  static restartApp() async {
    try {
      await _platform.invokeMethod('restartApp');
    } on PlatformException catch (e) {
      print("Failed to restart app: '${e.message}'.");
    }
  }
}
