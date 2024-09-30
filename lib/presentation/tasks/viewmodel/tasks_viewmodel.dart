import 'package:flutter/material.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

class TasksViewModel extends ChangeNotifier {
  Map<String, String> projectTasksStats = {
    '1': AppStrings.notStarted,
    '2': AppStrings.inProgress,
    '3': AppStrings.onHold,
    '4': AppStrings.cancelled,
    '5': AppStrings.finished,
  };

  List<String> tasksStatuses = [
    AppStrings.notStarted,
    AppStrings.inProgress,
    AppStrings.onHold,
    AppStrings.cancelled,
    AppStrings.finished,
  ];

  List<int> tasksStatusesCount = [
    0,
    0,
    0,
    0,
    0
  ]; //Not Started,InProgress,OnHold,Cancelled,Finished
  
  assignProjectTasksStatusesCounts(ProjectTasksModel projectTasks) {
    for (DataTasksProject data in projectTasks.dataTasksProject!) {
      switch (data.status) {
        case "1":
          tasksStatusesCount[0]++;
          break;
        case "2":
          tasksStatusesCount[1]++;
          break;
        case "3":
          tasksStatusesCount[2]++;
          break;
        case "4":
          tasksStatusesCount[3]++;
          break;
        case "5":
          tasksStatusesCount[4]++;
          break;
        default:
      }
    }
  }
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
