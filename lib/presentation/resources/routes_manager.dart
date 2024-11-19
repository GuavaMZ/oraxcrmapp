import 'package:go_router/go_router.dart';
import 'package:oraxcrm/domain/model/contracts_model.dart';
import 'package:oraxcrm/domain/model/knowledge_base_model.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/domain/model/projects_model.dart';
import 'package:oraxcrm/domain/model/support_tickets_model.dart';
import 'package:oraxcrm/presentation/about_us/view/about_us.dart';
import 'package:oraxcrm/presentation/activities/view/activities.dart';
import 'package:oraxcrm/presentation/changepassword/view/change_password.dart';
import 'package:oraxcrm/presentation/contact_us/view/contact_us.dart';
import 'package:oraxcrm/presentation/contracts/view/Contracts.dart';
import 'package:oraxcrm/presentation/contractsigning/sign_contract/view/sign_contract_view.dart';
import 'package:oraxcrm/presentation/contractsigning/view/contract_signing.dart';
import 'package:oraxcrm/presentation/files/view/files.dart';
import 'package:oraxcrm/presentation/homescreen/view/home_screen.dart';
import 'package:oraxcrm/presentation/knowlege_base/articles/view/articles_view.dart';
import 'package:oraxcrm/presentation/login/view/login_view.dart';
import 'package:oraxcrm/presentation/mainpage/view/mainpage.dart';
import 'package:oraxcrm/presentation/notifications/view/notifications.dart';
import 'package:oraxcrm/presentation/openticket/view/open_ticket.dart';
import 'package:oraxcrm/presentation/personalinfo/view/personal_info.dart';
import 'package:oraxcrm/presentation/profile/view/profile.dart';
import 'package:oraxcrm/presentation/project_discussions/discussion_details/view/discussion_details_view.dart';
import 'package:oraxcrm/presentation/project_files/files_details/view/file_details_view.dart';
import 'package:oraxcrm/presentation/projectdetails/view/project_details.dart';
import 'package:oraxcrm/presentation/projects/view/projects.dart';
import 'package:oraxcrm/presentation/splash_screen/view/splash.dart';
import 'package:oraxcrm/presentation/tasks/tasks_details/view/tasks_details.dart';
import 'package:oraxcrm/presentation/tasks/view/tasks.dart';
import 'package:oraxcrm/presentation/tickets/view/tickets.dart';
import 'package:oraxcrm/presentation/tickets_details/view/tickets_details.dart';
import 'package:oraxcrm/presentation/ticketssummary/view/tickets_summary.dart';
import 'package:oraxcrm/presentation/unified_number/view/unified_number.dart';

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
  static const String ticketsDetailsRoute = "/tickets_details/view";
  static const String signContractRoute = "/sign_contract/view";
  static const String tasksDetailsRoute = "/tasks_details/view";
  static const String discussionDetailsRoute = "/discussion_details/view";
  static const String fileDetailsRoute = "/file_details/view";
  static const String articlesRoute = "/articles/view";

  static final router = GoRouter(routes: [
    GoRoute(
      path: mainRoute,
      builder: (context, state) => const SplashScreenView(),
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
      builder: (context, state) =>
          ProjectDetailsView(projectData: state.extra as Dataprojects),
    ),
    GoRoute(
      path: projectsRoute,
      builder: (context, state) => const ProjectsView(),
    ),
    GoRoute(
      path: tasksRoute,
      builder: (context, state) => TasksView(
        projectTasksDetails: state.extra as ProjectTasksModel,
      ),
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
    GoRoute(
      path: ticketsDetailsRoute,
      builder: (context, state) => TicketsDetailsView(
        ticketDetails: state.extra as Dataticket,
      ),
    ),
    GoRoute(
      path: signContractRoute,
      builder: (context, state) => SignContractView(
        contract: state.extra as DataContract,
      ),
    ),
    GoRoute(
      path: tasksDetailsRoute,
      builder: (context, state) => TasksDetailsView(
        projectTaskDetails: state.extra as DataTasksProject,
      ),
    ),
    GoRoute(
      path: discussionDetailsRoute,
      builder: (context, state) => DiscussionDetailsView(
          // projectTaskDetails: state.extra as DataTasksProject,
          ),
    ),
    GoRoute(
      path: discussionDetailsRoute,
      builder: (context, state) => FileDetailsView(
          // projectTaskDetails: state.extra as DataTasksProject,
          ),
    ),
    GoRoute(
      path: articlesRoute,
      builder: (context, state) => ArticlesView(
        articlesModel: state.extra as ArticlesModel,
      ),
    ),
  ]);
}
