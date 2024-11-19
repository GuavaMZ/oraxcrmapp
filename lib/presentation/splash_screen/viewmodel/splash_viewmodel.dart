import 'package:device_info_plus/device_info_plus.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final isUpdateAvailable =
        await shorebirdCodePush.isNewPatchAvailableForDownload();

    if (isUpdateAvailable) {
      // Download the new patch if it's available.
      await shorebirdCodePush.downloadUpdateIfAvailable();
    }
  }

  checkAndroidVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    DataHolders.androidVersion = androidInfo.version.release;
  }
}
