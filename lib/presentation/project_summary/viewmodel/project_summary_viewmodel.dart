import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/projects_requests.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectSummaryViewModel extends ChangeNotifier {
  Future getProjectDetails(BuildContext context,String id) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
        SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final res = await projectsRequests.getProjectsDetails(
          {'Authorization': prefs.getString('usrToken')},id
          ).then((res) async {
        if (res.statusCode == 200) {
          
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return res;
    } catch (e) {
      print(e);
    }
  }
}