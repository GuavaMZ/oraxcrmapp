class ApiLinks {
  //static const String urlBaseMy = 'http://localhost:5100/api/v1/';
  static const String baseUrl = 'https://democrm.oraxsoft.net/';
  // static const String urlBaseMy = 'https://crm.oraxsoft.net/';

  static const String login = 'customers_api/v1/authentication';
  static const String logout = 'customers_api/v1/logout';
  static const String getNotifications = 'notifications/GetNotifications';
  static const String getProjects = 'customers_api/v1/projects';
  static const String getStaticHome = 'customers_api/v1/client/summarycount';
  static const String getProjectDetailsById = 'customers_api/v1/projects/id/';
  // static const String getProjects = 'api/projects';
  static const String getProjectTickets =
      'customers_api/v1/projects/project_tickets';
  static const String getProjectsTasks =
      'customers_api/v1/tasks/tasks_relationsby';
  static const String getProjectFiles =
      'customers_api/v1/projects/projectfiles';
  static const String Get_filesIDprojects_id =
      'customers_api/v1/projects/projectfile';
  static const String Get_Discussionsprojects_id =
      'customers_api/v1/projects/projectdiscussions';
  static const String Get_DiscussionsIDprojects_id =
      'customers_api/v1/projects/project_getdiscussion';
  static const String Get_activityprojects_id =
      'customers_api/v1/projects/project_get_activity';

  static const String getContracts = 'customers_api/v1/contracts';
  static const String getContractDetailById = 'customers_api/v1/contracts/id/';

  static const String getTickets = 'customers_api/v1/tickets';

  static const String getTicketDetailsById = 'customers_api/v1/tickets/id/';
  static const String getTicketAttachment =
      'customers_api/v1/tickets/ticket_attachments';
  static const String addReply = '/customers_api/v1/tickets/add_reply/';
  static const String addReplyForContract = 'customers_api/v1/contracts/';
  static const String addFeedback = 'customers_api/v1/Tickets/ticket_feedback';

  static const String getUserinform = 'Profile/getUserinform';
  static const String updateUserInfo = 'Profile/UpdatUserInformation';

  static const String getDepartments =
      'customers_api/v1/miscellaneous/group/departments';
  static const String getPriorties =
      'customers_api/v1/miscellaneous/group/get_ticket_priorities';

  static const String getEstimates = 'customers_api/v1/estimates';
  static const String getEstimatesDetailsById = 'customers_api/v1/estimates/id/';

  static const String getProposals = 'customers_api/v1/proposals';
  static const String getProposalsDetailsById = 'customers_api/v1/proposals/id/';
  static const String addProposalsComment = "/customers_api/v1/proposals/id/:id/group/proposals_comment";


  static const String getProjectActivities =
      'customers_api/v1/projects/project_get_activity';

  static const String getCustomerNotfy =
      'customers_api/v1/client/customernotfy';
  static const String getCustomerNotfyStateByID =
      'customers_api/v1/client/customernotfy?is_read=false';

  static const String getProfileImage =
      'customers_api/v1/client/profileimgeurl';
  static const String getCompanyInfo = 'customers_api/v1/client/companyinfo';
  static const String getProfileInfo = 'customers_api/v1/client/profileinfo';

  static const String editProfile = 'customers_api/v1/client/updateinfo';
  static const String editImageProfile =
      'customers_api/v1/client/profileimgeurl';
  static const String addProjectTask = 'customers_api/v1/projects/';

  static const String getFile = 'customers_api/v1/client/clientfiles';

//Sign Contracts Urls
  static const String getSignCode = 'customers_api/v1/contracts/sendcodeign';
  static const String checkSignCode = 'customers_api/v1/contracts/checkcodeign';
  static const String signContract = 'customers_api/v1/contracts/contractsing';
}
