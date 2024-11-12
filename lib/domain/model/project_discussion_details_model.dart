// ignore_for_file: prefer_void_to_null

class DiscussionsProjectDetailsModel {
  bool? status;
  Data? data;
  String? message;

  DiscussionsProjectDetailsModel({this.status, this.data, this.message});

  DiscussionsProjectDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? contractNum;
  String? id;
  String? content;
  String? description;
  String? subject;
  String? client;
  String? datestart;
  String? dateend;
  String? contractBy;
  String? contractType;
  String? projectId;
  String? addedfrom;
  String? dateadded;
  String? isexpirynotified;
  String? contractValue;
  String? trash;
  String? notVisibleToClient;
  String? hash;
  String? signed;
  Null signature;
  String? markedAsSigned;
  Null acceptanceFirstname;
  Null acceptanceLastname;
  Null acceptanceEmail;
  Null acceptanceDate;
  Null acceptanceIp;
  Null shortLink;
  String? isApproved;
  Null userApproved;
  Null approverdTime;
  Null serialNo;
  Null activationLey1;
  Null userActivation;
  String? supplierName;
  String? supplierCity;
  String? invoiceNum;
  String? crmIsapprove;
  String? crmUserApprove;
  String? crmDateApprove;
  String? crmUserDisapprove;
  String? crmDateDisapprove;
  String? name;
  String? userid;
  String? company;
  Null vat;
  String? phonenumber;
  String? country;
  String? city;
  String? zip;
  String? state;
  String? address;
  Null website;
  String? datecreated;
  String? active;
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
  String? defaultLanguage;
  String? defaultCurrency;
  String? showPrimaryContact;
  Null stripeId;
  String? registrationConfirmed;
  Null trandNo;
  Null trandType;
  String? isVendor;
  String? typeName;
  List<Null>? attachments;
  Null projectName;
  String? addedfromName;
  List<Null>? comments;

  Data(
      {this.contractNum,
      this.id,
      this.content,
      this.description,
      this.subject,
      this.client,
      this.datestart,
      this.dateend,
      this.contractBy,
      this.contractType,
      this.projectId,
      this.addedfrom,
      this.dateadded,
      this.isexpirynotified,
      this.contractValue,
      this.trash,
      this.notVisibleToClient,
      this.hash,
      this.signed,
      this.signature,
      this.markedAsSigned,
      this.acceptanceFirstname,
      this.acceptanceLastname,
      this.acceptanceEmail,
      this.acceptanceDate,
      this.acceptanceIp,
      this.shortLink,
      this.isApproved,
      this.userApproved,
      this.approverdTime,
      this.serialNo,
      this.activationLey1,
      this.userActivation,
      this.supplierName,
      this.supplierCity,
      this.invoiceNum,
      this.crmIsapprove,
      this.crmUserApprove,
      this.crmDateApprove,
      this.crmUserDisapprove,
      this.crmDateDisapprove,
      this.name,
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
      this.typeName,
      this.attachments,
      this.projectName,
      this.addedfromName,
      this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    contractNum = json['contract_num'];
    id = json['id'];
    content = json['content'];
    description = json['description'];
    subject = json['subject'];
    client = json['client'];
    datestart = json['datestart'];
    dateend = json['dateend'];
    contractBy = json['contract_by'];
    contractType = json['contract_type'];
    projectId = json['project_id'];
    addedfrom = json['addedfrom'];
    dateadded = json['dateadded'];
    isexpirynotified = json['isexpirynotified'];
    contractValue = json['contract_value'];
    trash = json['trash'];
    notVisibleToClient = json['not_visible_to_client'];
    hash = json['hash'];
    signed = json['signed'];
    signature = json['signature'];
    markedAsSigned = json['marked_as_signed'];
    acceptanceFirstname = json['acceptance_firstname'];
    acceptanceLastname = json['acceptance_lastname'];
    acceptanceEmail = json['acceptance_email'];
    acceptanceDate = json['acceptance_date'];
    acceptanceIp = json['acceptance_ip'];
    shortLink = json['short_link'];
    isApproved = json['IsApproved'];
    userApproved = json['userApproved'];
    approverdTime = json['approverdTime'];
    serialNo = json['serial_no'];
    activationLey1 = json['activation_ley1'];
    userActivation = json['user_activation'];
    supplierName = json['supplier_name'];
    supplierCity = json['supplier_city'];
    invoiceNum = json['invoice_num'];
    crmIsapprove = json['crm_isapprove'];
    crmUserApprove = json['crm_user_approve'];
    crmDateApprove = json['crm_date_approve'];
    crmUserDisapprove = json['crm_user_disapprove'];
    crmDateDisapprove = json['crm_date_disapprove'];
    name = json['name'];
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
    typeName = json['type_name'];
    if (json['attachments'] != null) {
      attachments = <Null>[];
      // json['attachments'].forEach((v) {
      //   attachments!.add(new Null.fromJson(v));
      // });
    }
    projectName = json['project_name'];
    addedfromName = json['addedfrom_name'];
    if (json['comments'] != null) {
      comments = <Null>[];
      // json['comments'].forEach((v) {
      //   comments!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contract_num'] = contractNum;
    data['id'] = id;
    data['content'] = content;
    data['description'] = description;
    data['subject'] = subject;
    data['client'] = client;
    data['datestart'] = datestart;
    data['dateend'] = dateend;
    data['contract_by'] = contractBy;
    data['contract_type'] = contractType;
    data['project_id'] = projectId;
    data['addedfrom'] = addedfrom;
    data['dateadded'] = dateadded;
    data['isexpirynotified'] = isexpirynotified;
    data['contract_value'] = contractValue;
    data['trash'] = trash;
    data['not_visible_to_client'] = notVisibleToClient;
    data['hash'] = hash;
    data['signed'] = signed;
    data['signature'] = signature;
    data['marked_as_signed'] = markedAsSigned;
    data['acceptance_firstname'] = acceptanceFirstname;
    data['acceptance_lastname'] = acceptanceLastname;
    data['acceptance_email'] = acceptanceEmail;
    data['acceptance_date'] = acceptanceDate;
    data['acceptance_ip'] = acceptanceIp;
    data['short_link'] = shortLink;
    data['IsApproved'] = isApproved;
    data['userApproved'] = userApproved;
    data['approverdTime'] = approverdTime;
    data['serial_no'] = serialNo;
    data['activation_ley1'] = activationLey1;
    data['user_activation'] = userActivation;
    data['supplier_name'] = supplierName;
    data['supplier_city'] = supplierCity;
    data['invoice_num'] = invoiceNum;
    data['crm_isapprove'] = crmIsapprove;
    data['crm_user_approve'] = crmUserApprove;
    data['crm_date_approve'] = crmDateApprove;
    data['crm_user_disapprove'] = crmUserDisapprove;
    data['crm_date_disapprove'] = crmDateDisapprove;
    data['name'] = name;
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
    data['type_name'] = typeName;
    // if (this.attachments != null) {
    //   data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    // }
    data['project_name'] = projectName;
    data['addedfrom_name'] = addedfromName;
    // if (this.comments != null) {
    //   data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
