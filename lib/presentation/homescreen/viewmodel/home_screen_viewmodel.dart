import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/data/api-request/crm_ads_requests.dart';
import 'package:oraxcrm/data/api-request/user_info_requests.dart';
import 'package:oraxcrm/domain/model/user_data_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  Future? currentCategoryFilterFuture;

  Future getUserInfo(BuildContext context) async {
    UserInfoRequests userInfoRequests = UserInfoRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('usrToken'));
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

  Future getCategories() async {
    CRMAdsRequests crmAdsRequests = CRMAdsRequests();
    try {
      final res = await crmAdsRequests.getCategories();
      return res;
    } catch (e) {
      return e;
    }
  }

  Future getAds() async {
    CRMAdsRequests crmAdsRequests = CRMAdsRequests();
    try {
      final res = await crmAdsRequests.getAdvertises();
      return res;
    } catch (e) {
      return e;
    }
  }

  Future getSystemsAndApps() async {
    CRMAdsRequests crmAdsRequests = CRMAdsRequests();
    try {
      final res = await crmAdsRequests.getSystemsAndApps();
      return res;
    } catch (e) {
      return e;
    }
  }

   Future getSystemsAndAppsBasedOnCategory(int categoryId) async {
    CRMAdsRequests crmAdsRequests = CRMAdsRequests();
    try {
      final res = await crmAdsRequests.getSystemsAndAppsBasedOnCategory(categoryId);
      return res;
    } catch (e) {
      return e;
    }
  }

  changeCategory(String selectedFilter,String filter){
    selectedFilter = filter;
    notifyListeners();
  }
}
