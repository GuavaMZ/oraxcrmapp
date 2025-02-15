import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/projects_requests.dart';
import 'package:oraxcrm/domain/model/project_activities_model.dart';
import 'package:oraxcrm/domain/model/project_discussions_model.dart';
import 'package:oraxcrm/domain/model/project_files_model.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/domain/model/project_tickets_model.dart';
import 'package:oraxcrm/presentation/client/project_discussions/view/project_discussions.dart';
import 'package:oraxcrm/presentation/client/project_files/view/project_files_view.dart';
// import 'package:oraxcrm/presentation/activities/view/activities.dart';
import 'package:oraxcrm/presentation/client/project_summary/view/project_summary.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/client/tasks/view/tasks.dart';
import 'package:oraxcrm/presentation/client/tickets/view/tickets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectDetailsViewModel extends ChangeNotifier {
  String initProjectDetailsPage = AppStrings.projectSummary;

  late TabController tabController;

  List<Widget> projectDetailsPages = const [
    ProjectSummaryView(),
    // TasksView(),
    // TicketsView(),
    // ProjectDiscussionsView(),
    // ProjectFiles()
    // ActivitiesView()
  ];

  List<String> projectDetailsTitles = [
    AppStrings.projectSummary,
    // AppStrings.tasks,
    // AppStrings.tickets,
    // AppStrings.discussions,
    // AppStrings.files
    // AppStrings.activities
  ];

  ProjectTasksModel? projectsTasks;
  ProjectTicketsModel? projectsTickets;
  ActiveProjectModel? projectActivities;
  DiscussionsProjectModel? projectDiscussions;
  FilesProjectModel? projectFiles;

  Future toggleNotifyListeners() async {
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
          print(projectsTasks);
          return projectTasksModel;
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
          return projectTicketsModel;
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

  Future getProjectActivities(BuildContext context, String id) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ActiveProjectModel? activeProjectModel;
    try {
      await projectsRequests.getProjectActivities(
          {'Authorization': prefs.getString('usrToken')}, id).then((res) async {
        print(res);
        if (res.statusCode == 200) {
          activeProjectModel = ActiveProjectModel.fromJson(res.data);
          projectActivities = activeProjectModel;
          return activeProjectModel;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return activeProjectModel;
    } catch (e) {
      print(e);
    }
  }

  Future getProjectDiscussions(BuildContext context, String id) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DiscussionsProjectModel? discussionsProjectModel;
    try {
      await projectsRequests.getProjectDiscussions(
          {'Authorization': prefs.getString('usrToken')}, id).then((res) async {
        if (res.statusCode == 200) {
          discussionsProjectModel = DiscussionsProjectModel.fromJson(res.data);
          projectDiscussions = discussionsProjectModel;
          return discussionsProjectModel;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return discussionsProjectModel;
    } catch (e) {
      print(e);
    }
  }

  Future getProjectFiles(BuildContext context, String id) async {
    ProjectsRequests projectsRequests = ProjectsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FilesProjectModel? filesProjectModel;
    try {
      await projectsRequests.getProjectFiles(
          {'Authorization': prefs.getString('usrToken')}, id).then((res) async {
        if (res.statusCode == 200) {
          filesProjectModel = FilesProjectModel.fromJson(res.data);
          projectFiles = filesProjectModel;
          return filesProjectModel;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return filesProjectModel;
    } catch (e) {
      print(e);
    }
  }
}
