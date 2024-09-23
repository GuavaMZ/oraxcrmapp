class ProjectsModel {
  bool? status;
  List<Dataprojects>? dataprojects;
  String? message;

  ProjectsModel({this.status, this.dataprojects, this.message});

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataprojects = <Dataprojects>[];
      json['data'].forEach((v) {
        dataprojects!.add( Dataprojects.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (dataprojects != null) {
      data['data'] = dataprojects!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DataProjectsHome {
  String? ticketid;
  String? adminreplying;
  String? userid;

  String? status;
  String? statusName;
  String? projectName;

  DataProjectsHome(
      {this.ticketid,
        this.adminreplying,
        this.userid,

        this.status,

        this.statusName,

        this.projectName});

  DataProjectsHome.fromJson(Map<String, dynamic> json) {
    ticketid = json['ticketid'];
    adminreplying = json['adminreplying'];
    userid = json['userid'];

    status = json['status'];
    statusName = json['status_name'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ticketid'] = ticketid;
    data['adminreplying'] = adminreplying;
    data['userid'] = userid;


    data['status'] = status;

    data['status_name'] = statusName;

    data['project_name'] = projectName;
    return data;
  }
}
class Dataprojects {
  String? id;
  String? name;
  String? description;
  String? status;
  String? clientid;
  String? billingType;
  String? startDate;
  String? deadline;
  String? projectCreated;
  String? dateFinished;
  String? progress;
  String? progressFromTasks;
  String? projectCost;
  String? projectRatePerHour;
  String? estimatedHours;
  String? addedfrom;
  String? contactNotification;
  String? notifyContacts;
  String? userid;
  String? company;
  String? vat;
  String? phonenumber;
  String? country;
  String? city;
  String? zip;
  String? state;
  String? address;
  String? website;
  String? datecreated;
  String? active;
  String? leadid;
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
  String? longitude;
  String? latitude;
  String? defaultLanguage;
  String? defaultCurrency;
  String? showPrimaryContact;
  String? stripeId;
  String? registrationConfirmed;
  String? trandNo;
  String? trandType;
  String? isVendor;
  String? subpointsCount;
  String? mainpointCount;
  String? stateName;
  String? addedfromName;

  Dataprojects(
      {this.id,
        this.name,
        this.description,
        this.status,
        this.clientid,
        this.billingType,
        this.startDate,
        this.deadline,
        this.projectCreated,
        this.dateFinished,
        this.progress,
        this.progressFromTasks,
        this.projectCost,
        this.projectRatePerHour,
        this.estimatedHours,
        this.addedfrom,
        this.contactNotification,
        this.notifyContacts,
        this.userid,
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
        this.trandNo,
        this.trandType,
        this.isVendor,
        this.subpointsCount,
        this.mainpointCount,
        this.stateName,
        this.addedfromName});

  Dataprojects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    clientid = json['clientid'];
    billingType = json['billing_type'];
    startDate = json['start_date'];
    deadline = json['deadline'];
    projectCreated = json['project_created'];
    dateFinished = json['date_finished'];
    progress = json['progress'];
    progressFromTasks = json['progress_from_tasks'];
    projectCost = json['project_cost'];
    projectRatePerHour = json['project_rate_per_hour'];
    estimatedHours = json['estimated_hours'];
    addedfrom = json['addedfrom'];
    contactNotification = json['contact_notification'];
    notifyContacts = json['notify_contacts'];
    userid = json['userid'];
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
    trandNo = json['trand_no'];
    trandType = json['trand_type'];
    isVendor = json['is_vendor'];
    subpointsCount = json['subpoints_count'];
    mainpointCount = json['mainpoint_count'];
    stateName = json['status_name'];
    addedfromName = json['addedfrom_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    data['clientid'] = clientid;
    data['billing_type'] = billingType;
    data['start_date'] = startDate;
    data['deadline'] = deadline;
    data['project_created'] = projectCreated;
    data['date_finished'] = dateFinished;
    data['progress'] = progress;
    data['progress_from_tasks'] = progressFromTasks;
    data['project_cost'] = projectCost;
    data['project_rate_per_hour'] = projectRatePerHour;
    data['estimated_hours'] = estimatedHours;
    data['addedfrom'] = addedfrom;
    data['contact_notification'] = contactNotification;
    data['notify_contacts'] = notifyContacts;
    data['userid'] = userid;
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
    data['trand_no'] = trandNo;
    data['trand_type'] = trandType;
    data['is_vendor'] = isVendor;
    data['subpoints_count'] = subpointsCount;
    data['mainpoint_count'] = mainpointCount;
    data['status_name'] = stateName;
    data['addedfrom_name'] = addedfromName;
    return data;
  }
}
