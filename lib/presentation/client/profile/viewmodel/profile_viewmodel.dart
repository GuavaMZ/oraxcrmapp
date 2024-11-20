import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  ValueListenable<String> userName =
      ValueNotifier(DataHolders.userDataModel?.data?.firstname ?? '');

  logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.remove('usrToken');
      context.pushReplacement(Routes.loginRoute);
    } catch (e) {
      print(e);
    }
  }
}
