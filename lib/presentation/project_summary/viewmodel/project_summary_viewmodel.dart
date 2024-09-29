import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/projects_requests.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectSummaryViewModel extends ChangeNotifier {
  DateTime currentDate = DateTime.now();
  DateTime? projectStartedDate;
  DateTime? projectDeadlineDate;
  int? daysLeft;
  double? projectProgressPrecentage;

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
          projectProgressPrecentage = (daysLeft! /
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
}
