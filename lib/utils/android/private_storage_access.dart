import 'dart:async' show StreamSubscription;
import 'dart:io';

import 'package:PiliPlus/utils/android/android_helper.dart';
import 'package:PiliPlus/utils/storage.dart';
import 'package:PiliPlus/utils/storage_key.dart';

abstract final class PrivateStorageAccess {
  static StreamSubscription? _subscription;
  static bool? _enabled;

  static void init() {
    if (!Platform.isAndroid) return;

    _subscription ??= GStorage.setting
        .watch(key: SettingBoxKey.accessPrivateStorage)
        .listen(
          (event) => set(!event.deleted && event.value == true),
        );
    set(
      GStorage.setting.get(SettingBoxKey.accessPrivateStorage) == true,
    );
  }

  static void set(bool enabled) {
    if (!Platform.isAndroid || _enabled == enabled) return;
    PiliAndroidHelper.setPrivateStorageAccess(enabled);
    _enabled = enabled;
  }
}
