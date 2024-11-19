import 'package:flutter/material.dart';
import 'package:oraxcrm/domain/model/project_tickets_model.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class TicketsViewModel extends ChangeNotifier {
  Map<String, String> projectTicketsStats = {
    '1': AppStrings.open,
    '2': AppStrings.inProgress,
    '3': AppStrings.answered,
    '4': AppStrings.onHold,
    '5': AppStrings.closed,
  };

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

  assignTicketsStatusesCounts(ProjectTicketsModel projectTicketsModel) {
    for (DataTicketsProject data in projectTicketsModel.dataTicketsProject!) {
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
}
