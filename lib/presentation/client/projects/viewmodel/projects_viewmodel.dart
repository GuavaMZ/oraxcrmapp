import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/projects_requests.dart';
import 'package:oraxcrm/domain/model/projects_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectsViewModel extends ChangeNotifier {
  bool getProjetcsLastPageFlag = false;

  List<String> projectsStatuses = [
    AppStrings.notStarted,
    AppStrings.inProgress,
    AppStrings.onHold,
    AppStrings.cancelled,
    AppStrings.finished,
  ];

  List<int> projectsStatusesCount = [
    0,
    0,
    0,
    0,
    0
  ]; //Open,InProgress,Answered,OnHold,Closed

  List<Dataprojects>? projectsList = [];

  Future getProjects(BuildContext context) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProjectsModel? projectsModel;
    print(prefs.getString('usrToken'));
    if (getProjetcsLastPageFlag == false) {
      try {
        await projectsRequests.getProjects(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            projectsModel = ProjectsModel.fromJson(res.data);
            projectsList!.addAll(projectsModel!.dataprojects!);
            getProjetcsLastPageFlag = true;
            assignProjectsStatusesCounts();
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return projectsModel?.dataprojects;
      } catch (e) {
        print(e);
      }
    }
  }

  assignProjectsStatusesCounts() {
    for (Dataprojects data in projectsList!) {
      switch (data.status) {
        case "1":
          projectsStatusesCount[0]++;
          break;
        case "2":
          projectsStatusesCount[1]++;
          break;
        case "3":
          projectsStatusesCount[2]++;
          break;
        case "4":
          projectsStatusesCount[3]++;
          break;
        case "5":
          projectsStatusesCount[4]++;
          break;
        default:
      }
    }
  }
}
