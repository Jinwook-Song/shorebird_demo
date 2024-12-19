import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shorebird_demo/core/core.dart';

abstract interface class AppInfo {
  String getAppName();

  String getPackageName();

  String getVersion();

  String getBuildNumber();
}

class AppInfoImpl implements AppInfo {
  final PackageInfo _packageInfo;

  AppInfoImpl(this._packageInfo);

  @override
  String getAppName() {
    return _packageInfo.appName;
  }

  @override
  String getVersion() {
    return _packageInfo.version;
  }

  @override
  String getPackageName() {
    return _packageInfo.packageName;
  }

  @override
  String getBuildNumber() {
    return _packageInfo.buildNumber;
  }
}

final appInfoProvider = Provider<AppInfo>(
  (ref) => AppInfoImpl(ref.read(packageInfoProvider)),
);
