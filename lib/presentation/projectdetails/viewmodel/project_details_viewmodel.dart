import 'package:flutter/material.dart';
import 'package:oraxcrm/presentation/activities/view/activities.dart';
import 'package:oraxcrm/presentation/project_summary/view/project_summary.dart';
import 'package:oraxcrm/presentation/project_tickets/view/projects_tickets.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:oraxcrm/presentation/tasks/view/tasks.dart';
import 'package:oraxcrm/presentation/tickets/view/tickets.dart';

class ProjectDetailsViewModel extends ChangeNotifier {
  String initProjectDetailsPage = AppStrings.projectSummary;

  late PageController tabController;
  
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

  toggleNotifyListeners(){
    notifyListeners() ;
  }
}
