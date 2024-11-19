import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/projects_requests.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectSummaryViewModel extends ChangeNotifier {
  DateTime currentDate = DateTime.now();
  DateTime? projectStartedDate;
  DateTime? projectDeadlineDate;
  int? daysLeft;
  double? projectProgressPercentage;
  double? openTasksPercentage;
  int taskCounts = 0;

  Map<String, String> projectTasksStats = {
    '1': AppStrings.notStarted,
    '4': AppStrings.inProgress,
    '3': AppStrings.onHold,
    '2': AppStrings.cancelled,
    '5': AppStrings.finished,
  };

  List<String> tasksStatuses = [
    AppStrings.notStarted,
    AppStrings.onHold,
    AppStrings.cancelled,
    AppStrings.inProgress,
    AppStrings.finished,
  ];

  List<int> tasksStatusesCount = [
    0,
    0,
    0,
    0,
    0
  ]; //Not Started,OnHold,Cancelled,InProgress,Finished

  Future getProjectDetails(BuildContext context, String id) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final res = await projectsRequests.getProjectsDetails(
          {'Authorization': prefs.getString('usrToken')}, id).then((res) async {
        if (res.statusCode == 200) {
          projectStartedDate = DateTime(
              int.parse(
                  res.data['data']['start_date'].toString().split('-')[0]),
              int.parse(
                  res.data['data']['start_date'].toString().split('-')[1]),
              int.parse(
                  res.data['data']['start_date'].toString().split('-')[2]));
          projectDeadlineDate = DateTime(
              int.parse(res.data['data']['deadline'].toString().split('-')[0]),
              int.parse(res.data['data']['deadline'].toString().split('-')[1]),
              int.parse(res.data['data']['deadline'].toString().split('-')[2]));
          daysLeft = projectDeadlineDate?.difference(currentDate).inDays;
          projectProgressPercentage = (daysLeft! /
              projectDeadlineDate!.difference(projectStartedDate!).inDays);
          return res;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return res.data;
    } catch (e) {
      print(e);
    }
  }

  Future assignProjectTasksStatusesCounts(
      ProjectTasksModel projectTasks) async {
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
    taskCounts = tasksStatusesCount[1] +
        tasksStatusesCount[2] +
        tasksStatusesCount[3] +
        tasksStatusesCount[4];
  }
}
