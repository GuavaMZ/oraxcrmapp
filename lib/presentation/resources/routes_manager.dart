import 'package:go_router/go_router.dart';
import 'package:oraxcrm/domain/model/contracts_model.dart';
import 'package:oraxcrm/domain/model/knowledge_base_model.dart';
import 'package:oraxcrm/domain/model/project_tasks_model.dart';
import 'package:oraxcrm/domain/model/projects_model.dart';
import 'package:oraxcrm/domain/model/support_tickets_model.dart';
import 'package:oraxcrm/presentation/client/about_us/view/about_us.dart';
import 'package:oraxcrm/presentation/client/activities/view/activities.dart';
import 'package:oraxcrm/presentation/client/changepassword/view/change_password.dart';
import 'package:oraxcrm/presentation/client/contact_us/view/contact_us.dart';
import 'package:oraxcrm/presentation/client/contract_details/view/contract_details.dart';
import 'package:oraxcrm/presentation/client/contracts/view/Contracts.dart';
import 'package:oraxcrm/presentation/client/contractsigning/sign_contract/view/sign_contract_view.dart';
import 'package:oraxcrm/presentation/client/contractsigning/view/contract_signing.dart';
import 'package:oraxcrm/presentation/client/estimates/view/estimates_view.dart';
import 'package:oraxcrm/presentation/client/files/view/files.dart';
import 'package:oraxcrm/presentation/client/homescreen/view/home_screen.dart';
import 'package:oraxcrm/presentation/client/knowlege_base/articles/view/articles_view.dart';
import 'package:oraxcrm/presentation/client/knowlege_base/view/knowledge_base_view.dart';
import 'package:oraxcrm/presentation/client/login/view/login_view.dart';
import 'package:oraxcrm/presentation/client/mainpage/view/mainpage.dart';
import 'package:oraxcrm/presentation/client/notifications/view/notifications.dart';
import 'package:oraxcrm/presentation/client/openticket/view/open_ticket.dart';
import 'package:oraxcrm/presentation/client/personalinfo/view/personal_info.dart';
import 'package:oraxcrm/presentation/client/profile/view/profile.dart';
import 'package:oraxcrm/presentation/client/project_discussions/discussion_details/view/discussion_details_view.dart';
import 'package:oraxcrm/presentation/client/project_files/files_details/view/file_details_view.dart';
import 'package:oraxcrm/presentation/client/projectdetails/view/project_details.dart';
import 'package:oraxcrm/presentation/client/projects/view/projects.dart';
import 'package:oraxcrm/presentation/client/proposals/view/proposals_view.dart';
import 'package:oraxcrm/presentation/client/splash_screen/view/splash.dart';
import 'package:oraxcrm/presentation/client/tasks/tasks_details/view/tasks_details.dart';
import 'package:oraxcrm/presentation/client/tasks/view/tasks.dart';
import 'package:oraxcrm/presentation/client/tickets/view/tickets.dart';
import 'package:oraxcrm/presentation/client/tickets_details/view/tickets_details.dart';
import 'package:oraxcrm/presentation/client/ticketssummary/view/tickets_summary.dart';
import 'package:oraxcrm/presentation/client/unified_number/view/unified_number.dart';
import 'package:oraxcrm/presentation/contract_details/contract_terms/view/contract_terms_view.dart';
import 'package:oraxcrm/presentation/employee/profile_emp/view/profile_emp.dart';

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
  static const String contractDetailsRoute = "/contract_details/view";
  static const String contractTermsRoute = "/contract_terms/view";
  static const String contractSigningRoute = "/contractSigning/view";
  static const String activitiesRoute = "/activities/view";
  static const String changePasswordRoute = "/changePassword/view";
  static const String ticketsDetailsRoute = "/tickets_details/view";
  static const String signContractRoute = "/sign_contract/view";
  static const String tasksDetailsRoute = "/tasks_details/view";
  static const String discussionDetailsRoute = "/discussion_details/view";
  static const String fileDetailsRoute = "/file_details/view";
  static const String articlesRoute = "/articles/view";
  static const String proposalsRoute = "/proposals/view";
  static const String estimatesRoute = "/estimates/view";
  static const String aboutUsRoute = "/about_us/view";
  static const String contactUsRoute = "/contact_us/view";
  static const String knowledgeBaseRoute = "/knowledge_base/view";

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
      path: contractDetailsRoute,
      builder: (context, state) =>
          ContractDetailsView(contract: state.extra as DataContract),
    ),
    GoRoute(
      path: contractTermsRoute,
      builder: (context, state) =>
          ContractTermsView(contract: state.extra as DataContract),
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
      path: knowledgeBaseRoute,
      builder: (context, state) => const KnowledgeBaseView(),
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
      path: estimatesRoute,
      builder: (context, state) => const EstimatesView(),
    ),
    GoRoute(
      path: proposalsRoute,
      builder: (context, state) => const ProposalsView(),
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
      path: aboutUsRoute,
      builder: (context, state) => const AboutUsView(),
    ),
    GoRoute(
      path: contactUsRoute,
      builder: (context, state) => const ContactUsView(),
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
      path: fileDetailsRoute,
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
