import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/notifications_requests.dart';
import 'package:oraxcrm/domain/model/notifications_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsViewModel extends ChangeNotifier {
  bool lastPageFlag = false;

  List<Data>? notificationsList = [];

  Future getNotifications(BuildContext context) async {
    NotificationsRequests notificationsRequests = NotificationsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    NotifcationModel? notifcationModel;
    print(prefs.getString('usrToken'));
    if (lastPageFlag == false) {
      try {
        await notificationsRequests.getNotifications(
            {'Authorization': prefs.getString('usrToken')!}).then((res) async {
          if (res.statusCode == 200) {
            notifcationModel = NotifcationModel.fromJson(res.data);
            notificationsList!.addAll(notifcationModel!.data!);
            lastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return notifcationModel?.data;
      } catch (e) {
        print(e);
      }
    }
  }
}
