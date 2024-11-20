import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:oraxcrm/data/api-request/tickets_requests.dart';
import 'package:oraxcrm/domain/model/tickets_details_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketsDetailsViewModel extends ChangeNotifier {
  TextEditingController messageTextController = TextEditingController();
  TicketsDetailsModel? ticketsDetails;

  Map<String, String> projectTicketsStats = {
    '1': AppStrings.open,
    '2': AppStrings.inProgress,
    '3': AppStrings.answered,
    '4': AppStrings.onHold,
    '5': AppStrings.closed,
  };

  // ignore: body_might_complete_normally_nullable
  Future<TicketsDetailsModel?> getTicketDetails(
      BuildContext context, String id) async {
    TicketsRequests ticketsRequests = TicketsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    TicketsDetailsModel? ticketsDetailsModel;
    try {
      await ticketsRequests.getTicketDetails(
          {'Authorization': prefs.getString('usrToken')}, id).then((res) async {
        if (res.statusCode == 200) {
          ticketsDetailsModel = TicketsDetailsModel.fromJson(res.data);
          ticketsDetails = ticketsDetailsModel;
          print(ticketsDetailsModel?.data);
          return ticketsDetailsModel;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return ticketsDetailsModel;
    } catch (e) {
      print(e);
    }
  }

  Future addReply(String id, dynamic body, BuildContext context) async {
    TicketsRequests ticketsRequests = TicketsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await ticketsRequests.addReply(
          {'Authorization': prefs.getString('usrToken')}, id, body).then((res) {
        if (res.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.replySent.getString(context))));
          notifyListeners();
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
