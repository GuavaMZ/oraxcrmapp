import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/data/api-request/user_info_requests.dart';
import 'package:oraxcrm/domain/model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  Future getUserInfo() async {
    UserInfoRequests userInfoRequests = UserInfoRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await userInfoRequests.getUserInfo(
          {'Authorization': prefs.getString('usrToken')}).then((res) {
        print(res);
        DataHolders.userDataModel = UserDataModel.fromJson(res.data);
        print(DataHolders.userDataModel!.data?.firstname);
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
