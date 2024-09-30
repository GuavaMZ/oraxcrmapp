import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel {
  int splashDuration = 3000; // 3 seconds


  Future<bool> checkForUsrToken() async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('usrToken');
    if (userToken == null) {
      return false;
    }else {
      return true;
    }

  }
}