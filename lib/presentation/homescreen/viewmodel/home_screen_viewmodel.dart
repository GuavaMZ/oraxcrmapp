import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/data/api-request/user_info_requests.dart';
import 'package:oraxcrm/domain/model/user_data_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  Future getUserInfo(BuildContext context) async {
    UserInfoRequests userInfoRequests = UserInfoRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await userInfoRequests.getUserInfo(
          {'Authorization': prefs.getString('usrToken')}).then((res) {
        if (res.statusCode == 200) {
          DataHolders.userDataModel = UserDataModel.fromJson(res.data);
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
    }
  }
}
