import 'package:go_router/go_router.dart';
import 'package:oraxcrm/presentation/activities/view/activities.dart';
import 'package:oraxcrm/presentation/changepassword/view/change_password.dart';
import 'package:oraxcrm/presentation/contracts/view/Contracts.dart';
import 'package:oraxcrm/presentation/contractsigning/view/contract_signing.dart';
import 'package:oraxcrm/presentation/files/view/files.dart';
import 'package:oraxcrm/presentation/homescreen/view/home_screen.dart';
import 'package:oraxcrm/presentation/login/view/login_view.dart';
import 'package:oraxcrm/presentation/mainpage/view/mainpage.dart';
import 'package:oraxcrm/presentation/openticket/view/open_ticket.dart';
import 'package:oraxcrm/presentation/personalinfo/view/personal_info.dart';
import 'package:oraxcrm/presentation/profile/view/profile.dart';
import 'package:oraxcrm/presentation/projectdetails/view/project_details.dart';
import 'package:oraxcrm/presentation/projects/view/projects.dart';
import 'package:oraxcrm/presentation/tasks/view/tasks.dart';
import 'package:oraxcrm/presentation/tickets/view/tickets.dart';
import 'package:oraxcrm/presentation/ticketssummary/view/tickets_summary.dart';

class Routes {
  static const String mainRoute = "/";
  static const String loginRoute = "/login/view";
  static const String profileRoute = "/profile/view";
  static const String homeScreenRoute = "/homeScreen/view";
  static const String mainScreenRoute = "/mainScreen/view";
  static const String filesRoute = "/files/view";
  static const String projectsRoute = "/projects/view";
  static const String tasksRoute = "/tasks/view";
  static const String ticketsRoute = "/tickets/view";
  static const String ticketsSummaryRoute = "/ticketsSummary/view";
  static const String projectDetailsRoute = "/projectDetails/view";
  static const String openTicketRoute = "/openTicket/view";
  static const String personalInfoRoute = "/personalInfo/view";
  static const String contractsRoute = "/contracts/view";
  static const String contractSigningRoute = "/contractSigning/view";
  static const String activitiesRoute = "/activities/view";
  static const String changePasswordRoute = "/changePassword/view";

  static final router = GoRouter(routes: [
    GoRoute(
      path: mainRoute,
      builder: (context, state) => const MainPageView(),
    ),
    GoRoute(
      path: filesRoute,
      builder: (context, state) => const FilesView(),
    ),
    GoRoute(
      path: homeScreenRoute,
      builder: (context, state) => const HomeScreenView(),
    ),
    GoRoute(
      path: mainScreenRoute,
      builder: (context, state) => const MainPageView(),
    ),
    GoRoute(
      path: activitiesRoute,
      builder: (context, state) => const ActivitiesView(),
    ),
    GoRoute(
      path: changePasswordRoute,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: contractsRoute,
      builder: (context, state) => const ContractsView(),
    ),
    GoRoute(
      path: contractSigningRoute,
      builder: (context, state) => const ContractSigningView(),
    ),
    GoRoute(
      path: openTicketRoute,
      builder: (context, state) => const OpenTicketView(),
    ),
    GoRoute(
      path: personalInfoRoute,
      builder: (context, state) => const PersonalInfoView(),
    ),
    GoRoute(
      path: profileRoute,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: projectDetailsRoute,
      builder: (context, state) => const ProjectDetailsView(),
    ),
    GoRoute(
      path: projectsRoute,
      builder: (context, state) => const ProjectsView(),
    ),
    GoRoute(
      path: tasksRoute,
      builder: (context, state) => const TasksView(),
    ),
    GoRoute(
      path: ticketsRoute,
      builder: (context, state) => const TicketsView(),
    ),
    GoRoute(
      path: ticketsSummaryRoute,
      builder: (context, state) => const TicketsSummaryView(),
    ),
    GoRoute(
      path: loginRoute,
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
