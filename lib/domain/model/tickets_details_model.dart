// ignore_for_file: non_constant_identifier_names
class TicketsDetailsModel {
  TicketsDetailsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  final bool? status;
  final DataTicketsDetails? data;
  final String? message;

  factory TicketsDetailsModel.fromJson(Map<String, dynamic> json) {
    return TicketsDetailsModel(
      status: json["status"],
      data: json["data"] == null
          ? null
          : DataTicketsDetails.fromJson(json["data"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class DataTicketsDetails {
  DataTicketsDetails({
    required this.ticketid,
    required this.adminreplying,
    required this.userid,
    required this.contactid,
    required this.mergedTicketId,
    required this.email,
    required this.name,
    required this.department,
    required this.priority,
    required this.status,
    required this.service,
    required this.ticketkey,
    required this.subject,
    required this.message,
    required this.admin,
    required this.date,
    required this.projectId,
    required this.lastreply,
    required this.clientread,
    required this.adminread,
    required this.assigned,
    required this.staffIdReplying,
    required this.cc,
    required this.departmentid,
    required this.imapUsername,
    required this.emailFromHeader,
    required this.host,
    required this.password,
    required this.encryption,
    required this.folder,
    required this.deleteAfterImport,
    required this.calendarId,
    required this.hidefromclient,
    required this.managerId,
    required this.parentId,
    required this.ticketstatusid,
    required this.isdefault,
    required this.statuscolor,
    required this.statusorder,
    required this.serviceid,
    required this.company,
    required this.vat,
    required this.phonenumber,
    required this.country,
    required this.city,
    required this.zip,
    required this.state,
    required this.address,
    required this.website,
    required this.datecreated,
    required this.active,
    required this.leadid,
    required this.billingStreet,
    required this.billingCity,
    required this.billingState,
    required this.billingZip,
    required this.billingCountry,
    required this.shippingStreet,
    required this.shippingCity,
    required this.shippingState,
    required this.shippingZip,
    required this.shippingCountry,
    required this.longitude,
    required this.latitude,
    required this.defaultLanguage,
    required this.defaultCurrency,
    required this.showPrimaryContact,
    required this.stripeId,
    required this.registrationConfirmed,
    required this.addedfrom,
    required this.trandNo,
    required this.trandType,
    required this.isVendor,
    required this.subpointsCount,
    required this.mainpointCount,
    required this.staffid,
    required this.firstname,
    required this.lastname,
    required this.facebook,
    required this.linkedin,
    required this.skype,
    required this.profileImage,
    required this.lastIp,
    required this.lastLogin,
    required this.lastActivity,
    required this.lastPasswordChange,
    required this.newPassKey,
    required this.newPassKeyRequested,
    required this.role,
    required this.direction,
    required this.mediaPathSlug,
    required this.isNotStaff,
    required this.hourlyRate,
    required this.twoFactorAuthEnabled,
    required this.twoFactorAuthCode,
    required this.twoFactorAuthCodeRequested,
    required this.emailSignature,
    required this.birthday,
    required this.birthplace,
    required this.sex,
    required this.maritalStatus,
    required this.nation,
    required this.religion,
    required this.identification,
    required this.daysForIdentity,
    required this.homeTown,
    required this.resident,
    required this.currentAddress,
    required this.literacy,
    required this.ortherInfor,
    required this.jobPosition,
    required this.workplace,
    required this.placeOfIssue,
    required this.accountNumber,
    required this.nameAccount,
    required this.issueBank,
    required this.recordsReceived,
    required this.personalTaxCode,
    required this.googleAuthSecret,
    required this.teamManage,
    required this.staffIdentifi,
    required this.statusWork,
    required this.dateUpdate,
    required this.isSupport,
    required this.sendContractWp,
    required this.contractManger,
    required this.hoursWorking,
    required this.id,
    required this.isPrimary,
    required this.title,
    required this.emailVerifiedAt,
    required this.emailVerificationKey,
    required this.emailVerificationSentAt,
    required this.invoiceEmails,
    required this.estimateEmails,
    required this.creditNoteEmails,
    required this.contractEmails,
    required this.taskEmails,
    required this.projectEmails,
    required this.ticketEmails,
    required this.customerApiKey,
    required this.priorityid,
    required this.fromName,
    required this.ticketEmail,
    required this.departmentName,
    required this.priorityName,
    required this.serviceName,
    required this.statusName,
    required this.userFirstname,
    required this.userLastname,
    required this.staffFirstname,
    required this.staffLastname,
    required this.submitter,
    required this.attachments,
    required this.ticketReplies,
    required this.addedfromName,
    required this.projectName,
  });

  final String? ticketid;
  final String? adminreplying;
  final String? userid;
  final String? contactid;
  final dynamic mergedTicketId;
  final String? email;
  final dynamic name;
  final String? department;
  final String? priority;
  final String? status;
  final String? service;
  final String? ticketkey;
  final String? subject;
  final String? message;
  final dynamic admin;
  final DateTime? date;
  final String? projectId;
  final DateTime? lastreply;
  final String? clientread;
  final String? adminread;
  final String? assigned;
  final dynamic staffIdReplying;
  final dynamic cc;
  final String? departmentid;
  final String? imapUsername;
  final String? emailFromHeader;
  final String? host;
  final String? password;
  final String? encryption;
  final String? folder;
  final String? deleteAfterImport;
  final dynamic calendarId;
  final String? hidefromclient;
  final String? managerId;
  final String? parentId;
  final String? ticketstatusid;
  final String? isdefault;
  final String? statuscolor;
  final String? statusorder;
  final dynamic serviceid;
  final String? company;
  final dynamic vat;
  final String? phonenumber;
  final String? country;
  final String? city;
  final String? zip;
  final String? state;
  final String? address;
  final dynamic website;
  final DateTime? datecreated;
  final String? active;
  final dynamic leadid;
  final String? billingStreet;
  final String? billingCity;
  final String? billingState;
  final String? billingZip;
  final String? billingCountry;
  final String? shippingStreet;
  final String? shippingCity;
  final String? shippingState;
  final String? shippingZip;
  final String? shippingCountry;
  final dynamic longitude;
  final dynamic latitude;
  final dynamic defaultLanguage;
  final String? defaultCurrency;
  final String? showPrimaryContact;
  final dynamic stripeId;
  final String? registrationConfirmed;
  final String? addedfrom;
  final dynamic trandNo;
  final dynamic trandType;
  final dynamic isVendor;
  final String? subpointsCount;
  final String? mainpointCount;
  final dynamic staffid;
  final String? firstname;
  final String? lastname;
  final dynamic facebook;
  final dynamic linkedin;
  final dynamic skype;
  final dynamic profileImage;
  final String? lastIp;
  final DateTime? lastLogin;
  final dynamic lastActivity;
  final DateTime? lastPasswordChange;
  final dynamic newPassKey;
  final dynamic newPassKeyRequested;
  final dynamic role;
  final String? direction;
  final dynamic mediaPathSlug;
  final dynamic isNotStaff;
  final dynamic hourlyRate;
  final dynamic twoFactorAuthEnabled;
  final dynamic twoFactorAuthCode;
  final dynamic twoFactorAuthCodeRequested;
  final dynamic emailSignature;
  final dynamic birthday;
  final dynamic birthplace;
  final dynamic sex;
  final dynamic maritalStatus;
  final dynamic nation;
  final dynamic religion;
  final dynamic identification;
  final dynamic daysForIdentity;
  final dynamic homeTown;
  final dynamic resident;
  final dynamic currentAddress;
  final dynamic literacy;
  final dynamic ortherInfor;
  final dynamic jobPosition;
  final dynamic workplace;
  final dynamic placeOfIssue;
  final dynamic accountNumber;
  final dynamic nameAccount;
  final dynamic issueBank;
  final dynamic recordsReceived;
  final dynamic personalTaxCode;
  final dynamic googleAuthSecret;
  final dynamic teamManage;
  final dynamic staffIdentifi;
  final dynamic statusWork;
  final dynamic dateUpdate;
  final dynamic isSupport;
  final dynamic sendContractWp;
  final dynamic contractManger;
  final dynamic hoursWorking;
  final String? id;
  final String? isPrimary;
  final String? title;
  final DateTime? emailVerifiedAt;
  final dynamic emailVerificationKey;
  final dynamic emailVerificationSentAt;
  final String? invoiceEmails;
  final String? estimateEmails;
  final String? creditNoteEmails;
  final String? contractEmails;
  final String? taskEmails;
  final String? projectEmails;
  final String? ticketEmails;
  final String? customerApiKey;
  final dynamic priorityid;
  final dynamic fromName;
  final dynamic ticketEmail;
  final String? departmentName;
  final dynamic priorityName;
  final dynamic serviceName;
  final String? statusName;
  final String? userFirstname;
  final String? userLastname;
  final dynamic staffFirstname;
  final dynamic staffLastname;
  final String? submitter;
  final List<dynamic> attachments;
  final List<TicketReply> ticketReplies;
  final String? addedfromName;
  final String? projectName;

  factory DataTicketsDetails.fromJson(Map<String, dynamic> json) {
    return DataTicketsDetails(
      ticketid: json["ticketid"],
      adminreplying: json["adminreplying"],
      userid: json["userid"],
      contactid: json["contactid"],
      mergedTicketId: json["merged_ticket_id"],
      email: json["email"],
      name: json["name"],
      department: json["department"],
      priority: json["priority"],
      status: json["status"],
      service: json["service"],
      ticketkey: json["ticketkey"],
      subject: json["subject"],
      message: json["message"],
      admin: json["admin"],
      date: DateTime.tryParse(json["date"] ?? ""),
      projectId: json["project_id"],
      lastreply: DateTime.tryParse(json["lastreply"] ?? ""),
      clientread: json["clientread"],
      adminread: json["adminread"],
      assigned: json["assigned"],
      staffIdReplying: json["staff_id_replying"],
      cc: json["cc"],
      departmentid: json["departmentid"],
      imapUsername: json["imap_username"],
      emailFromHeader: json["email_from_header"],
      host: json["host"],
      password: json["password"],
      encryption: json["encryption"],
      folder: json["folder"],
      deleteAfterImport: json["delete_after_import"],
      calendarId: json["calendar_id"],
      hidefromclient: json["hidefromclient"],
      managerId: json["manager_id"],
      parentId: json["parent_id"],
      ticketstatusid: json["ticketstatusid"],
      isdefault: json["isdefault"],
      statuscolor: json["statuscolor"],
      statusorder: json["statusorder"],
      serviceid: json["serviceid"],
      company: json["company"],
      vat: json["vat"],
      phonenumber: json["phonenumber"],
      country: json["country"],
      city: json["city"],
      zip: json["zip"],
      state: json["state"],
      address: json["address"],
      website: json["website"],
      datecreated: DateTime.tryParse(json["datecreated"] ?? ""),
      active: json["active"],
      leadid: json["leadid"],
      billingStreet: json["billing_street"],
      billingCity: json["billing_city"],
      billingState: json["billing_state"],
      billingZip: json["billing_zip"],
      billingCountry: json["billing_country"],
      shippingStreet: json["shipping_street"],
      shippingCity: json["shipping_city"],
      shippingState: json["shipping_state"],
      shippingZip: json["shipping_zip"],
      shippingCountry: json["shipping_country"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      defaultLanguage: json["default_language"],
      defaultCurrency: json["default_currency"],
      showPrimaryContact: json["show_primary_contact"],
      stripeId: json["stripe_id"],
      registrationConfirmed: json["registration_confirmed"],
      addedfrom: json["addedfrom"],
      trandNo: json["trand_no"],
      trandType: json["trand_type"],
      isVendor: json["is_vendor"],
      subpointsCount: json["subpoints_count"],
      mainpointCount: json["mainpoint_count"],
      staffid: json["staffid"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      facebook: json["facebook"],
      linkedin: json["linkedin"],
      skype: json["skype"],
      profileImage: json["profile_image"],
      lastIp: json["last_ip"],
      lastLogin: DateTime.tryParse(json["last_login"] ?? ""),
      lastActivity: json["last_activity"],
      lastPasswordChange: DateTime.tryParse(json["last_password_change"] ?? ""),
      newPassKey: json["new_pass_key"],
      newPassKeyRequested: json["new_pass_key_requested"],
      role: json["role"],
      direction: json["direction"],
      mediaPathSlug: json["media_path_slug"],
      isNotStaff: json["is_not_staff"],
      hourlyRate: json["hourly_rate"],
      twoFactorAuthEnabled: json["two_factor_auth_enabled"],
      twoFactorAuthCode: json["two_factor_auth_code"],
      twoFactorAuthCodeRequested: json["two_factor_auth_code_requested"],
      emailSignature: json["email_signature"],
      birthday: json["birthday"],
      birthplace: json["birthplace"],
      sex: json["sex"],
      maritalStatus: json["marital_status"],
      nation: json["nation"],
      religion: json["religion"],
      identification: json["identification"],
      daysForIdentity: json["days_for_identity"],
      homeTown: json["home_town"],
      resident: json["resident"],
      currentAddress: json["current_address"],
      literacy: json["literacy"],
      ortherInfor: json["orther_infor"],
      jobPosition: json["job_position"],
      workplace: json["workplace"],
      placeOfIssue: json["place_of_issue"],
      accountNumber: json["account_number"],
      nameAccount: json["name_account"],
      issueBank: json["issue_bank"],
      recordsReceived: json["records_received"],
      personalTaxCode: json["Personal_tax_code"],
      googleAuthSecret: json["google_auth_secret"],
      teamManage: json["team_manage"],
      staffIdentifi: json["staff_identifi"],
      statusWork: json["status_work"],
      dateUpdate: json["date_update"],
      isSupport: json["is_support"],
      sendContractWp: json["send_contractWP"],
      contractManger: json["contract_manger"],
      hoursWorking: json["hours_working"],
      id: json["id"],
      isPrimary: json["is_primary"],
      title: json["title"],
      emailVerifiedAt: DateTime.tryParse(json["email_verified_at"] ?? ""),
      emailVerificationKey: json["email_verification_key"],
      emailVerificationSentAt: json["email_verification_sent_at"],
      invoiceEmails: json["invoice_emails"],
      estimateEmails: json["estimate_emails"],
      creditNoteEmails: json["credit_note_emails"],
      contractEmails: json["contract_emails"],
      taskEmails: json["task_emails"],
      projectEmails: json["project_emails"],
      ticketEmails: json["ticket_emails"],
      customerApiKey: json["customer_api_key"],
      priorityid: json["priorityid"],
      fromName: json["from_name"],
      ticketEmail: json["ticket_email"],
      departmentName: json["department_name"],
      priorityName: json["priority_name"],
      serviceName: json["service_name"],
      statusName: json["status_name"],
      userFirstname: json["user_firstname"],
      userLastname: json["user_lastname"],
      staffFirstname: json["staff_firstname"],
      staffLastname: json["staff_lastname"],
      submitter: json["submitter"],
      attachments: json["attachments"] == null
          ? []
          : List<dynamic>.from(json["attachments"]!.map((x) => x)),
      ticketReplies: json["ticket_replies"] == null
          ? []
          : List<TicketReply>.from(
              json["ticket_replies"]!.map((x) => TicketReply.fromJson(x))),
      addedfromName: json["addedfrom_name"],
      projectName: json["project_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ticketid": ticketid,
        "adminreplying": adminreplying,
        "userid": userid,
        "contactid": contactid,
        "merged_ticket_id": mergedTicketId,
        "email": email,
        "name": name,
        "department": department,
        "priority": priority,
        "status": status,
        "service": service,
        "ticketkey": ticketkey,
        "subject": subject,
        "message": message,
        "admin": admin,
        "date": date?.toIso8601String(),
        "project_id": projectId,
        "lastreply": lastreply?.toIso8601String(),
        "clientread": clientread,
        "adminread": adminread,
        "assigned": assigned,
        "staff_id_replying": staffIdReplying,
        "cc": cc,
        "departmentid": departmentid,
        "imap_username": imapUsername,
        "email_from_header": emailFromHeader,
        "host": host,
        "password": password,
        "encryption": encryption,
        "folder": folder,
        "delete_after_import": deleteAfterImport,
        "calendar_id": calendarId,
        "hidefromclient": hidefromclient,
        "manager_id": managerId,
        "parent_id": parentId,
        "ticketstatusid": ticketstatusid,
        "isdefault": isdefault,
        "statuscolor": statuscolor,
        "statusorder": statusorder,
        "serviceid": serviceid,
        "company": company,
        "vat": vat,
        "phonenumber": phonenumber,
        "country": country,
        "city": city,
        "zip": zip,
        "state": state,
        "address": address,
        "website": website,
        "datecreated": datecreated?.toIso8601String(),
        "active": active,
        "leadid": leadid,
        "billing_street": billingStreet,
        "billing_city": billingCity,
        "billing_state": billingState,
        "billing_zip": billingZip,
        "billing_country": billingCountry,
        "shipping_street": shippingStreet,
        "shipping_city": shippingCity,
        "shipping_state": shippingState,
        "shipping_zip": shippingZip,
        "shipping_country": shippingCountry,
        "longitude": longitude,
        "latitude": latitude,
        "default_language": defaultLanguage,
        "default_currency": defaultCurrency,
        "show_primary_contact": showPrimaryContact,
        "stripe_id": stripeId,
        "registration_confirmed": registrationConfirmed,
        "addedfrom": addedfrom,
        "trand_no": trandNo,
        "trand_type": trandType,
        "is_vendor": isVendor,
        "subpoints_count": subpointsCount,
        "mainpoint_count": mainpointCount,
        "staffid": staffid,
        "firstname": firstname,
        "lastname": lastname,
        "facebook": facebook,
        "linkedin": linkedin,
        "skype": skype,
        "profile_image": profileImage,
        "last_ip": lastIp,
        "last_login": lastLogin?.toIso8601String(),
        "last_activity": lastActivity,
        "last_password_change": lastPasswordChange?.toIso8601String(),
        "new_pass_key": newPassKey,
        "new_pass_key_requested": newPassKeyRequested,
        "role": role,
        "direction": direction,
        "media_path_slug": mediaPathSlug,
        "is_not_staff": isNotStaff,
        "hourly_rate": hourlyRate,
        "two_factor_auth_enabled": twoFactorAuthEnabled,
        "two_factor_auth_code": twoFactorAuthCode,
        "two_factor_auth_code_requested": twoFactorAuthCodeRequested,
        "email_signature": emailSignature,
        "birthday": birthday,
        "birthplace": birthplace,
        "sex": sex,
        "marital_status": maritalStatus,
        "nation": nation,
        "religion": religion,
        "identification": identification,
        "days_for_identity": daysForIdentity,
        "home_town": homeTown,
        "resident": resident,
        "current_address": currentAddress,
        "literacy": literacy,
        "orther_infor": ortherInfor,
        "job_position": jobPosition,
        "workplace": workplace,
        "place_of_issue": placeOfIssue,
        "account_number": accountNumber,
        "name_account": nameAccount,
        "issue_bank": issueBank,
        "records_received": recordsReceived,
        "Personal_tax_code": personalTaxCode,
        "google_auth_secret": googleAuthSecret,
        "team_manage": teamManage,
        "staff_identifi": staffIdentifi,
        "status_work": statusWork,
        "date_update": dateUpdate,
        "is_support": isSupport,
        "send_contractWP": sendContractWp,
        "contract_manger": contractManger,
        "hours_working": hoursWorking,
        "id": id,
        "is_primary": isPrimary,
        "title": title,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "email_verification_key": emailVerificationKey,
        "email_verification_sent_at": emailVerificationSentAt,
        "invoice_emails": invoiceEmails,
        "estimate_emails": estimateEmails,
        "credit_note_emails": creditNoteEmails,
        "contract_emails": contractEmails,
        "task_emails": taskEmails,
        "project_emails": projectEmails,
        "ticket_emails": ticketEmails,
        "customer_api_key": customerApiKey,
        "priorityid": priorityid,
        "from_name": fromName,
        "ticket_email": ticketEmail,
        "department_name": departmentName,
        "priority_name": priorityName,
        "service_name": serviceName,
        "status_name": statusName,
        "user_firstname": userFirstname,
        "user_lastname": userLastname,
        "staff_firstname": staffFirstname,
        "staff_lastname": staffLastname,
        "submitter": submitter,
        "attachments": attachments.map((x) => x).toList(),
        "ticket_replies": ticketReplies.map((x) => x?.toJson()).toList(),
        "addedfrom_name": addedfromName,
        "project_name": projectName,
      };
}

class TicketReply {
  TicketReply({
    required this.id,
    required this.fromName,
    required this.replyEmail,
    required this.admin,
    required this.userid,
    required this.message,
    required this.date,
    required this.contactid,
    required this.submitter,
    required this.attachments,
  });

  final String? id;
  final dynamic fromName;
  final dynamic replyEmail;
  final dynamic admin;
  final String? userid;
  final String? message;
  final DateTime? date;
  final String? contactid;
  final String? submitter;
  final List<dynamic> attachments;

  factory TicketReply.fromJson(Map<String, dynamic> json) {
    return TicketReply(
      id: json["id"],
      fromName: json["from_name"],
      replyEmail: json["reply_email"],
      admin: json["admin"],
      userid: json["userid"],
      message: json["message"],
      date: DateTime.tryParse(json["date"] ?? ""),
      contactid: json["contactid"],
      submitter: json["submitter"],
      attachments: json["attachments"] == null
          ? []
          : List<dynamic>.from(json["attachments"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "from_name": fromName,
        "reply_email": replyEmail,
        "admin": admin,
        "userid": userid,
        "message": message,
        "date": date?.toIso8601String(),
        "contactid": contactid,
        "submitter": submitter,
        "attachments": attachments.map((x) => x).toList(),
      };
}

class ResultReblayModel {
  bool? status;
  String? message;
  int? ticketid;

  ResultReblayModel({this.status, this.message, this.ticketid});

  ResultReblayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    ticketid = json['ticketid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['ticketid'] = ticketid;
    return data;
  }
}

class TicketAttachmentsDetails {
  TicketAttachmentsDetails({
    required this.id,
    required this.ticketid,
    required this.replyid,
    required this.file_name,
    required this.filetype,
    required this.dateadded,
    required this.path,
  });

  String? id;
  String? ticketid;
  String? replyid;
  String? file_name;
  String? filetype;
  String? dateadded;
  String? path;

  factory TicketAttachmentsDetails.fromJson(Map<String, dynamic> json) {
    return TicketAttachmentsDetails(
      id: json["id"],
      ticketid: json["ticketid"],
      replyid: json["replyid"],
      file_name: json["file_name"],
      filetype: json["filetype"],
      dateadded: json["dateadded"],
      // date: DateTime.tryParse(json["date"] ?? ""),
      path: json["path"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ticketid'] = ticketid;
    data['replyid'] = replyid;
    data['file_name'] = file_name;
    data['filetype'] = filetype;
    data['dateadded'] = dateadded;
    data['path'] = path;
    return data;
  }
}

class TicketAttachmentsModel {
  TicketAttachmentsModel({
    required this.status,
    required this.files,
    required this.message,
  });

  final bool? status;
  final TicketAttachmentsDetails? files;
  final String? message;

  factory TicketAttachmentsModel.fromJson(Map<String, dynamic> json) {
    return TicketAttachmentsModel(
      status: json["status"],
      files: json["files"].isEmpty
          ? null
          : TicketAttachmentsDetails.fromJson(json["files"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "files": files,
        "message": message,
      };
}
