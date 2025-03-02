import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/main.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class SplashViewModel {
  int splashDuration = 3000; // 3 seconds

  Future<bool> checkForUsrToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('usrToken');
    if (userToken == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> checkForUpdates() async {
    // Check whether a patch is available to install.
    final isUpdateAvailable = await shorebirdCodePush.checkForUpdate();

    if (isUpdateAvailable == UpdateStatus.outdated) {
      // Download the new patch if it's available.

      try {
        await shorebirdCodePush.update();
        Restart.restartApp(
            notificationTitle: 'Restarting App',
            notificationBody: 'Please tap here to open the app again.');
      } catch (e) {
        return;
      }

      // restartApp();
    }
  }

  void restartApp() {
    runApp(MyApp());
  }

  checkAndroidVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    DataHolders.androidVersion = androidInfo.version.release;
  }
}
