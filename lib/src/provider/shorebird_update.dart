import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shorebird_demo/src/service/shorebird_update.dart';

part 'shorebird_update.g.dart';

@riverpod
FutureOr<bool> shorebirdUpdate(Ref ref) {
  return ref.read(shorebirServiceProvider).update();
}
