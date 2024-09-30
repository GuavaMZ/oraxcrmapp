import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/projects_requests.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/domain/model/project_tickets_model.dart';
import 'package:oraxcrm/presentation/activities/view/activities.dart';
import 'package:oraxcrm/presentation/project_summary/view/project_summary.dart';
import 'package:oraxcrm/presentation/project_tickets/view/projects_tickets.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/tasks/view/tasks.dart';
import 'package:oraxcrm/presentation/tickets/view/tickets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectDetailsViewModel extends ChangeNotifier {
  String initProjectDetailsPage = AppStrings.projectSummary;

  late TabController tabController;

  List<Widget> projectDetailsPages = const [
    ProjectSummaryView(),
    TasksView(),
    TicketsView(),
    ActivitiesView()
  ];

  List<String> projectDetailsTitles = [
    AppStrings.projectSummary,
    AppStrings.tasks,
    AppStrings.tickets,
    AppStrings.activities
  ];

  ProjectTasksModel? projectsTasks;
  ProjectTicketsModel? projectsTickets;

  toggleNotifyListeners() {
    notifyListeners();
  }

  Future getProjectTasks(BuildContext context, String id) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProjectTasksModel? projectTasksModel;
    try {
      await projectsRequests.getProjectTasks(
          {'Authorization': prefs.getString('usrToken')}, id).then((res) async {
        if (res.statusCode == 200) {
          projectTasksModel = ProjectTasksModel.fromJson(res.data);
          projectsTasks = projectTasksModel;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return projectTasksModel;
    } catch (e) {
      print(e);
    }
  }

  Future getProjectTickets(BuildContext context, String id) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProjectTicketsModel? projectTicketsModel;
    try {
      await projectsRequests.getProjectTickets(
          {'Authorization': prefs.getString('usrToken')}, id).then((res) async {
        if (res.statusCode == 200) {
          projectTicketsModel = ProjectTicketsModel.fromJson(res.data);
          projectsTickets = projectTicketsModel;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return projectTicketsModel;
    } catch (e) {
      print(e);
    }
  }
}
