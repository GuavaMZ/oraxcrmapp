// ignore_for_file: prefer_void_to_null

class ProposalsModel {
  bool? status;
  List<Data>? data;
  String? message;

  ProposalsModel({this.status, this.data, this.message});

  ProposalsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? ticketid;
  String? adminreplying;
  String? userid;
  String? contactid;
  Null mergedTicketId;
  String? email;
  Null name;
  String? department;
  String? priority;
  String? status;
  String? service;
  String? ticketkey;
  String? subject;
  String? message;
  Null admin;
  String? date;
  String? projectId;
  Null lastreply;
  String? clientread;
  String? adminread;
  String? assigned;
  Null staffIdReplying;
  Null cc;
  String? departmentid;
  String? imapUsername;
  String? emailFromHeader;
  String? host;
  Null password;
  String? encryption;
  String? folder;
  String? deleteAfterImport;
  Null calendarId;
  String? hidefromclient;
  String? managerId;
  String? parentId;
  String? ticketstatusid;
  String? isdefault;
  String? statuscolor;
  String? statusorder;
  Null serviceid;
  String? company;
  Null vat;
  Null phonenumber;
  String? country;
  String? city;
  String? zip;
  String? state;
  String? address;
  Null website;
  Null datecreated;
  Null active;
  Null leadid;
  String? billingStreet;
  String? billingCity;
  String? billingState;
  String? billingZip;
  String? billingCountry;
  String? shippingStreet;
  String? shippingCity;
  String? shippingState;
  String? shippingZip;
  String? shippingCountry;
  Null longitude;
  Null latitude;
  Null defaultLanguage;
  String? defaultCurrency;
  String? showPrimaryContact;
  Null stripeId;
  String? registrationConfirmed;
  String? addedfrom;
  Null trandNo;
  Null trandType;
  Null isVendor;
  String? id;
  String? isPrimary;
  Null firstname;
  Null lastname;
  String? title;
  Null newPassKey;
  Null newPassKeyRequested;
  String? emailVerifiedAt;
  Null emailVerificationKey;
  Null emailVerificationSentAt;
  Null lastIp;
  Null lastLogin;
  Null lastPasswordChange;
  Null profileImage;
  Null direction;
  String? invoiceEmails;
  String? estimateEmails;
  String? creditNoteEmails;
  String? contractEmails;
  String? taskEmails;
  String? projectEmails;
  String? ticketEmails;
  String? customerApiKey;
  Null staffid;
  Null facebook;
  Null linkedin;
  Null skype;
  Null lastActivity;
  Null role;
  Null mediaPathSlug;
  Null isNotStaff;
  Null hourlyRate;
  Null twoFactorAuthEnabled;
  Null twoFactorAuthCode;
  Null twoFactorAuthCodeRequested;
  Null emailSignature;
  Null birthday;
  Null birthplace;
  Null sex;
  Null maritalStatus;
  Null nation;
  Null religion;
  Null identification;
  Null daysForIdentity;
  Null homeTown;
  Null resident;
  Null currentAddress;
  Null literacy;
  Null ortherInfor;
  Null jobPosition;
  Null workplace;
  Null placeOfIssue;
  Null accountNumber;
  Null nameAccount;
  Null issueBank;
  Null recordsReceived;
  Null personalTaxCode;
  Null googleAuthSecret;
  Null teamManage;
  Null staffIdentifi;
  Null statusWork;
  Null dateUpdate;
  Null isSupport;
  Null sendContractWP;
  Null contractManger;
  Null hoursWorking;
  Null priorityid;
  Null fromName;
  Null ticketEmail;
  String? departmentName;
  Null priorityName;
  Null serviceName;
  String? statusName;
  String? userFirstname;
  String? userLastname;
  Null staffFirstname;
  Null staffLastname;
  String? addedfromName;
  String? projectName;

  Data(
      {this.ticketid,
      this.adminreplying,
      this.userid,
      this.contactid,
      this.mergedTicketId,
      this.email,
      this.name,
      this.department,
      this.priority,
      this.status,
      this.service,
      this.ticketkey,
      this.subject,
      this.message,
      this.admin,
      this.date,
      this.projectId,
      this.lastreply,
      this.clientread,
      this.adminread,
      this.assigned,
      this.staffIdReplying,
      this.cc,
      this.departmentid,
      this.imapUsername,
      this.emailFromHeader,
      this.host,
      this.password,
      this.encryption,
      this.folder,
      this.deleteAfterImport,
      this.calendarId,
      this.hidefromclient,
      this.managerId,
      this.parentId,
      this.ticketstatusid,
      this.isdefault,
      this.statuscolor,
      this.statusorder,
      this.serviceid,
      this.company,
      this.vat,
      this.phonenumber,
      this.country,
      this.city,
      this.zip,
      this.state,
      this.address,
      this.website,
      this.datecreated,
      this.active,
      this.leadid,
      this.billingStreet,
      this.billingCity,
      this.billingState,
      this.billingZip,
      this.billingCountry,
      this.shippingStreet,
      this.shippingCity,
      this.shippingState,
      this.shippingZip,
      this.shippingCountry,
      this.longitude,
      this.latitude,
      this.defaultLanguage,
      this.defaultCurrency,
      this.showPrimaryContact,
      this.stripeId,
      this.registrationConfirmed,
      this.addedfrom,
      this.trandNo,
      this.trandType,
      this.isVendor,
      this.id,
      this.isPrimary,
      this.firstname,
      this.lastname,
      this.title,
      this.newPassKey,
      this.newPassKeyRequested,
      this.emailVerifiedAt,
      this.emailVerificationKey,
      this.emailVerificationSentAt,
      this.lastIp,
      this.lastLogin,
      this.lastPasswordChange,
      this.profileImage,
      this.direction,
      this.invoiceEmails,
      this.estimateEmails,
      this.creditNoteEmails,
      this.contractEmails,
      this.taskEmails,
      this.projectEmails,
      this.ticketEmails,
      this.customerApiKey,
      this.staffid,
      this.facebook,
      this.linkedin,
      this.skype,
      this.lastActivity,
      this.role,
      this.mediaPathSlug,
      this.isNotStaff,
      this.hourlyRate,
      this.twoFactorAuthEnabled,
      this.twoFactorAuthCode,
      this.twoFactorAuthCodeRequested,
      this.emailSignature,
      this.birthday,
      this.birthplace,
      this.sex,
      this.maritalStatus,
      this.nation,
      this.religion,
      this.identification,
      this.daysForIdentity,
      this.homeTown,
      this.resident,
      this.currentAddress,
      this.literacy,
      this.ortherInfor,
      this.jobPosition,
      this.workplace,
      this.placeOfIssue,
      this.accountNumber,
      this.nameAccount,
      this.issueBank,
      this.recordsReceived,
      this.personalTaxCode,
      this.googleAuthSecret,
      this.teamManage,
      this.staffIdentifi,
      this.statusWork,
      this.dateUpdate,
      this.isSupport,
      this.sendContractWP,
      this.contractManger,
      this.hoursWorking,
      this.priorityid,
      this.fromName,
      this.ticketEmail,
      this.departmentName,
      this.priorityName,
      this.serviceName,
      this.statusName,
      this.userFirstname,
      this.userLastname,
      this.staffFirstname,
      this.staffLastname,
      this.addedfromName,
      this.projectName});

  Data.fromJson(Map<String, dynamic> json) {
    ticketid = json['ticketid'];
    adminreplying = json['adminreplying'];
    userid = json['userid'];
    contactid = json['contactid'];
    mergedTicketId = json['merged_ticket_id'];
    email = json['email'];
    name = json['name'];
    department = json['department'];
    priority = json['priority'];
    status = json['status'];
    service = json['service'];
    ticketkey = json['ticketkey'];
    subject = json['subject'];
    message = json['message'];
    admin = json['admin'];
    date = json['date'];
    projectId = json['project_id'];
    lastreply = json['lastreply'];
    clientread = json['clientread'];
    adminread = json['adminread'];
    assigned = json['assigned'];
    staffIdReplying = json['staff_id_replying'];
    cc = json['cc'];
    departmentid = json['departmentid'];
    imapUsername = json['imap_username'];
    emailFromHeader = json['email_from_header'];
    host = json['host'];
    password = json['password'];
    encryption = json['encryption'];
    folder = json['folder'];
    deleteAfterImport = json['delete_after_import'];
    calendarId = json['calendar_id'];
    hidefromclient = json['hidefromclient'];
    managerId = json['manager_id'];
    parentId = json['parent_id'];
    ticketstatusid = json['ticketstatusid'];
    isdefault = json['isdefault'];
    statuscolor = json['statuscolor'];
    statusorder = json['statusorder'];
    serviceid = json['serviceid'];
    company = json['company'];
    vat = json['vat'];
    phonenumber = json['phonenumber'];
    country = json['country'];
    city = json['city'];
    zip = json['zip'];
    state = json['state'];
    address = json['address'];
    website = json['website'];
    datecreated = json['datecreated'];
    active = json['active'];
    leadid = json['leadid'];
    billingStreet = json['billing_street'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingZip = json['billing_zip'];
    billingCountry = json['billing_country'];
    shippingStreet = json['shipping_street'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    shippingZip = json['shipping_zip'];
    shippingCountry = json['shipping_country'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    defaultLanguage = json['default_language'];
    defaultCurrency = json['default_currency'];
    showPrimaryContact = json['show_primary_contact'];
    stripeId = json['stripe_id'];
    registrationConfirmed = json['registration_confirmed'];
    addedfrom = json['addedfrom'];
    trandNo = json['trand_no'];
    trandType = json['trand_type'];
    isVendor = json['is_vendor'];
    id = json['id'];
    isPrimary = json['is_primary'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    title = json['title'];
    newPassKey = json['new_pass_key'];
    newPassKeyRequested = json['new_pass_key_requested'];
    emailVerifiedAt = json['email_verified_at'];
    emailVerificationKey = json['email_verification_key'];
    emailVerificationSentAt = json['email_verification_sent_at'];
    lastIp = json['last_ip'];
    lastLogin = json['last_login'];
    lastPasswordChange = json['last_password_change'];
    profileImage = json['profile_image'];
    direction = json['direction'];
    invoiceEmails = json['invoice_emails'];
    estimateEmails = json['estimate_emails'];
    creditNoteEmails = json['credit_note_emails'];
    contractEmails = json['contract_emails'];
    taskEmails = json['task_emails'];
    projectEmails = json['project_emails'];
    ticketEmails = json['ticket_emails'];
    customerApiKey = json['customer_api_key'];
    staffid = json['staffid'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    skype = json['skype'];
    lastActivity = json['last_activity'];
    role = json['role'];
    mediaPathSlug = json['media_path_slug'];
    isNotStaff = json['is_not_staff'];
    hourlyRate = json['hourly_rate'];
    twoFactorAuthEnabled = json['two_factor_auth_enabled'];
    twoFactorAuthCode = json['two_factor_auth_code'];
    twoFactorAuthCodeRequested = json['two_factor_auth_code_requested'];
    emailSignature = json['email_signature'];
    birthday = json['birthday'];
    birthplace = json['birthplace'];
    sex = json['sex'];
    maritalStatus = json['marital_status'];
    nation = json['nation'];
    religion = json['religion'];
    identification = json['identification'];
    daysForIdentity = json['days_for_identity'];
    homeTown = json['home_town'];
    resident = json['resident'];
    currentAddress = json['current_address'];
    literacy = json['literacy'];
    ortherInfor = json['orther_infor'];
    jobPosition = json['job_position'];
    workplace = json['workplace'];
    placeOfIssue = json['place_of_issue'];
    accountNumber = json['account_number'];
    nameAccount = json['name_account'];
    issueBank = json['issue_bank'];
    recordsReceived = json['records_received'];
    personalTaxCode = json['Personal_tax_code'];
    googleAuthSecret = json['google_auth_secret'];
    teamManage = json['team_manage'];
    staffIdentifi = json['staff_identifi'];
    statusWork = json['status_work'];
    dateUpdate = json['date_update'];
    isSupport = json['is_support'];
    sendContractWP = json['send_contractWP'];
    contractManger = json['contract_manger'];
    hoursWorking = json['hours_working'];
    priorityid = json['priorityid'];
    fromName = json['from_name'];
    ticketEmail = json['ticket_email'];
    departmentName = json['department_name'];
    priorityName = json['priority_name'];
    serviceName = json['service_name'];
    statusName = json['status_name'];
    userFirstname = json['user_firstname'];
    userLastname = json['user_lastname'];
    staffFirstname = json['staff_firstname'];
    staffLastname = json['staff_lastname'];
    addedfromName = json['addedfrom_name'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketid'] = ticketid;
    data['adminreplying'] = adminreplying;
    data['userid'] = userid;
    data['contactid'] = contactid;
    data['merged_ticket_id'] = mergedTicketId;
    data['email'] = email;
    data['name'] = name;
    data['department'] = department;
    data['priority'] = priority;
    data['status'] = status;
    data['service'] = service;
    data['ticketkey'] = ticketkey;
    data['subject'] = subject;
    data['message'] = message;
    data['admin'] = admin;
    data['date'] = date;
    data['project_id'] = projectId;
    data['lastreply'] = lastreply;
    data['clientread'] = clientread;
    data['adminread'] = adminread;
    data['assigned'] = assigned;
    data['staff_id_replying'] = staffIdReplying;
    data['cc'] = cc;
    data['departmentid'] = departmentid;
    data['imap_username'] = imapUsername;
    data['email_from_header'] = emailFromHeader;
    data['host'] = host;
    data['password'] = password;
    data['encryption'] = encryption;
    data['folder'] = folder;
    data['delete_after_import'] = deleteAfterImport;
    data['calendar_id'] = calendarId;
    data['hidefromclient'] = hidefromclient;
    data['manager_id'] = managerId;
    data['parent_id'] = parentId;
    data['ticketstatusid'] = ticketstatusid;
    data['isdefault'] = isdefault;
    data['statuscolor'] = statuscolor;
    data['statusorder'] = statusorder;
    data['serviceid'] = serviceid;
    data['company'] = company;
    data['vat'] = vat;
    data['phonenumber'] = phonenumber;
    data['country'] = country;
    data['city'] = city;
    data['zip'] = zip;
    data['state'] = state;
    data['address'] = address;
    data['website'] = website;
    data['datecreated'] = datecreated;
    data['active'] = active;
    data['leadid'] = leadid;
    data['billing_street'] = billingStreet;
    data['billing_city'] = billingCity;
    data['billing_state'] = billingState;
    data['billing_zip'] = billingZip;
    data['billing_country'] = billingCountry;
    data['shipping_street'] = shippingStreet;
    data['shipping_city'] = shippingCity;
    data['shipping_state'] = shippingState;
    data['shipping_zip'] = shippingZip;
    data['shipping_country'] = shippingCountry;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['default_language'] = defaultLanguage;
    data['default_currency'] = defaultCurrency;
    data['show_primary_contact'] = showPrimaryContact;
    data['stripe_id'] = stripeId;
    data['registration_confirmed'] = registrationConfirmed;
    data['addedfrom'] = addedfrom;
    data['trand_no'] = trandNo;
    data['trand_type'] = trandType;
    data['is_vendor'] = isVendor;
    data['id'] = id;
    data['is_primary'] = isPrimary;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['title'] = title;
    data['new_pass_key'] = newPassKey;
    data['new_pass_key_requested'] = newPassKeyRequested;
    data['email_verified_at'] = emailVerifiedAt;
    data['email_verification_key'] = emailVerificationKey;
    data['email_verification_sent_at'] = emailVerificationSentAt;
    data['last_ip'] = lastIp;
    data['last_login'] = lastLogin;
    data['last_password_change'] = lastPasswordChange;
    data['profile_image'] = profileImage;
    data['direction'] = direction;
    data['invoice_emails'] = invoiceEmails;
    data['estimate_emails'] = estimateEmails;
    data['credit_note_emails'] = creditNoteEmails;
    data['contract_emails'] = contractEmails;
    data['task_emails'] = taskEmails;
    data['project_emails'] = projectEmails;
    data['ticket_emails'] = ticketEmails;
    data['customer_api_key'] = customerApiKey;
    data['staffid'] = staffid;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['skype'] = skype;
    data['last_activity'] = lastActivity;
    data['role'] = role;
    data['media_path_slug'] = mediaPathSlug;
    data['is_not_staff'] = isNotStaff;
    data['hourly_rate'] = hourlyRate;
    data['two_factor_auth_enabled'] = twoFactorAuthEnabled;
    data['two_factor_auth_code'] = twoFactorAuthCode;
    data['two_factor_auth_code_requested'] = twoFactorAuthCodeRequested;
    data['email_signature'] = emailSignature;
    data['birthday'] = birthday;
    data['birthplace'] = birthplace;
    data['sex'] = sex;
    data['marital_status'] = maritalStatus;
    data['nation'] = nation;
    data['religion'] = religion;
    data['identification'] = identification;
    data['days_for_identity'] = daysForIdentity;
    data['home_town'] = homeTown;
    data['resident'] = resident;
    data['current_address'] = currentAddress;
    data['literacy'] = literacy;
    data['orther_infor'] = ortherInfor;
    data['job_position'] = jobPosition;
    data['workplace'] = workplace;
    data['place_of_issue'] = placeOfIssue;
    data['account_number'] = accountNumber;
    data['name_account'] = nameAccount;
    data['issue_bank'] = issueBank;
    data['records_received'] = recordsReceived;
    data['Personal_tax_code'] = personalTaxCode;
    data['google_auth_secret'] = googleAuthSecret;
    data['team_manage'] = teamManage;
    data['staff_identifi'] = staffIdentifi;
    data['status_work'] = statusWork;
    data['date_update'] = dateUpdate;
    data['is_support'] = isSupport;
    data['send_contractWP'] = sendContractWP;
    data['contract_manger'] = contractManger;
    data['hours_working'] = hoursWorking;
    data['priorityid'] = priorityid;
    data['from_name'] = fromName;
    data['ticket_email'] = ticketEmail;
    data['department_name'] = departmentName;
    data['priority_name'] = priorityName;
    data['service_name'] = serviceName;
    data['status_name'] = statusName;
    data['user_firstname'] = userFirstname;
    data['user_lastname'] = userLastname;
    data['staff_firstname'] = staffFirstname;
    data['staff_lastname'] = staffLastname;
    data['addedfrom_name'] = addedfromName;
    data['project_name'] = projectName;
    return data;
  }
}
