import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/tickets_requests.dart';
import 'package:oraxcrm/domain/model/support_tickets_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketsSummaryViewModel extends ChangeNotifier {
  List<String> ticketsStatuses = [
    AppStrings.open,
    AppStrings.inProgress,
    AppStrings.answered,
    AppStrings.onHold,
    AppStrings.closed,
  ];

  List<int> ticketsStatusesCount = [
    0,
    0,
    0,
    0,
    0
  ]; //Open,InProgress,Answered,OnHold,Closed

  Map<String, String> ticketsStatusesDictionary = {
    "1": AppStrings.open,
    "2": AppStrings.open,
    "3": AppStrings.open,
    "4": AppStrings.open,
    "5": AppStrings.open,
  };

  int currentPage = 1;
  int limit = 20;
  bool isLastPage = false;
  bool isLoading = false;

  ScrollController scrollController = ScrollController();

  List<Dataticket>? supportTicketsList = []; //Added for the sake of pagination

  Future getSupportTickets(BuildContext context) async {
    TicketsRequests ticketsRequests = TicketsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SupportTicketsModel? supportTicketsModel;
    print(prefs.getString('usrToken'));
    try {
      await ticketsRequests.listAllTickets(
          {'Authorization': prefs.getString('usrToken')},
          currentPage,
          limit).then((res) async {
        if (res.statusCode == 200) {
          supportTicketsModel = SupportTicketsModel.fromJson(res.data);
          supportTicketsList!.addAll(supportTicketsModel!.dataticket!);
          assignTicketsStatusesCounts();
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return supportTicketsModel?.dataticket;
    } catch (e) {
      print(e);
    }
  }

  assignTicketsStatusesCounts() {
    for (Dataticket data in supportTicketsList!) {
      switch (data.status) {
        case "1":
          ticketsStatusesCount[0]++;
          break;
        case "2":
          ticketsStatusesCount[1]++;
          break;
        case "3":
          ticketsStatusesCount[2]++;
          break;
        case "4":
          ticketsStatusesCount[3]++;
          break;
        case "5":
          ticketsStatusesCount[4]++;
          break;
        default:
      }
    }
  }

  loadMoreData() async {
    currentPage++;
    print(currentPage);
    // await getSupportTickets(currentPage, limit);
  }

  void scrollListener() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        isLastPage == false) {
      await loadMoreData();
    }
  }
}
