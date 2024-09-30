import 'package:flutter/material.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class TasksViewModel extends ChangeNotifier {
  Map<String, String> projectTasksStats = {
    '1': AppStrings.notStarted,
    '2': AppStrings.inProgress,
    '3': AppStrings.onHold,
    '4': AppStrings.cancelled,
    '5': AppStrings.finished,
  };
  //  for (DataTasksProject data in tasksProjectModel!.dataTasksProject!) {
  //   if (data.status == "1") {
  //     await NotStartedCount++;
  //   }
  //   else if (data.status == "2") {
  //     await InProgressCount++;
  //   }
  //   else if (data.status == "3") {
  //     await  OnHoldCount++;
  //   }
  //   else if (data.status == "4") {
  //     await CancelledCount++;
  //   }
  //   else if (data.status == "5") {
  //     await  FinishedCount++;
  //   }
  //   Length=tasksProjectModel!.dataTasksProject!.length;
  //   if(tasksProjectModel!.dataTasksProject!.length>=1){
  //     SumeCount=(InProgressCount)/Length;
  //   }
  //   else{
  //     SumeCount=0;
  //   }

  // }
}
