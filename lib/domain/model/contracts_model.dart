class ContractsModel {
  ContractsModel({
    required this.status,
    required this.dataContract,
    required this.message,
  });

  final bool? status;
  final List<DataContract> dataContract;
  final String? message;

  factory ContractsModel.fromJson(Map<String, dynamic> json) {
    return ContractsModel(
      status: json["status"],
      dataContract: json["data"] == null
          ? []
          : List<DataContract>.from(
              json["data"]!.map((x) => DataContract.fromJson(x))),
      message: json["message"],
    );
  }
}

class DataContract {
  DataContract({
    required this.contractNum,
    required this.id,
    required this.content,
    required this.description,
    required this.subject,
    required this.client,
    required this.datestart,
    required this.dateend,
    required this.contractBy,
    required this.contractType,
    required this.projectId,
    required this.addedfrom,
    required this.dateadded,
    required this.isexpirynotified,
    required this.contractValue,
    required this.trash,
    required this.notVisibleToClient,
    required this.hash,
    required this.signed,
    required this.signature,
    required this.markedAsSigned,
    required this.acceptanceFirstname,
    required this.acceptanceLastname,
    required this.acceptanceEmail,
    required this.acceptanceDate,
    required this.acceptanceIp,
    required this.shortLink,
    required this.isApproved,
    required this.userApproved,
    required this.approverdTime,
    required this.serialNo,
    required this.activationLey1,
    required this.userActivation,
    required this.supplierName,
    required this.supplierCity,
    required this.invoiceNum,
    required this.crmIsapprove,
    required this.crmUserApprove,
    required this.crmDateApprove,
    required this.crmUserDisapprove,
    required this.crmDateDisapprove,
    required this.name,
    required this.userid,
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
    required this.trandNo,
    required this.trandType,
    required this.isVendor,
    required this.subpointsCount,
    required this.mainpointCount,
    required this.typeName,
    required this.attachments,
    required this.projectName,
    required this.addedfromName,
  });

  final String? contractNum;
  final String? id;
  final dynamic content;
  final String? description;
  final String? subject;
  final String? client;
  final DateTime? datestart;
  final DateTime? dateend;
  final String? contractBy;
  final String? contractType;
  final String? projectId;
  final String? addedfrom;
  final DateTime? dateadded;
  final String? isexpirynotified;
  final String? contractValue;
  final String? trash;
  final String? notVisibleToClient;
  final String? hash;
  final String? signed;
  final dynamic signature;
  final String? markedAsSigned;
  final dynamic acceptanceFirstname;
  final dynamic acceptanceLastname;
  final dynamic acceptanceEmail;
  final dynamic acceptanceDate;
  final dynamic acceptanceIp;
  final dynamic shortLink;
  final String? isApproved;
  final dynamic userApproved;
  final dynamic approverdTime;
  final dynamic serialNo;
  final dynamic activationLey1;
  final dynamic userActivation;
  final String? supplierName;
  final String? supplierCity;
  final String? invoiceNum;
  final String? crmIsapprove;
  final String? crmUserApprove;
  final DateTime? crmDateApprove;
  final String? crmUserDisapprove;
  final String? crmDateDisapprove;
  final String? name;
  final String? userid;
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
  final String? defaultLanguage;
  final String? defaultCurrency;
  final String? showPrimaryContact;
  final dynamic stripeId;
  final String? registrationConfirmed;
  final dynamic trandNo;
  final dynamic trandType;
  final String? isVendor;
  final String? subpointsCount;
  final String? mainpointCount;
  final String? typeName;
  final List<dynamic> attachments;
  final dynamic projectName;
  final String? addedfromName;

  factory DataContract.fromJson(Map<String, dynamic> json) {
    return DataContract(
      contractNum: json["contract_num"],
      id: json["id"],
      content: json["content"],
      description: json["description"],
      subject: json["subject"],
      client: json["client"],
      datestart: DateTime.tryParse(json["datestart"] ?? ""),
      dateend: DateTime.tryParse(json["dateend"] ?? ""),
      contractBy: json["contract_by"],
      contractType: json["contract_type"],
      projectId: json["project_id"],
      addedfrom: json["addedfrom"],
      dateadded: DateTime.tryParse(json["dateadded"] ?? ""),
      isexpirynotified: json["isexpirynotified"],
      contractValue: json["contract_value"],
      trash: json["trash"],
      notVisibleToClient: json["not_visible_to_client"],
      hash: json["hash"],
      signed: json["signed"],
      signature: json["signature"],
      markedAsSigned: json["marked_as_signed"],
      acceptanceFirstname: json["acceptance_firstname"],
      acceptanceLastname: json["acceptance_lastname"],
      acceptanceEmail: json["acceptance_email"],
      acceptanceDate: json["acceptance_date"],
      acceptanceIp: json["acceptance_ip"],
      shortLink: json["short_link"],
      isApproved: json["IsApproved"],
      userApproved: json["userApproved"],
      approverdTime: json["approverdTime"],
      serialNo: json["serial_no"],
      activationLey1: json["activation_ley1"],
      userActivation: json["user_activation"],
      supplierName: json["supplier_name"],
      supplierCity: json["supplier_city"],
      invoiceNum: json["invoice_num"],
      crmIsapprove: json["crm_isapprove"],
      crmUserApprove: json["crm_user_approve"],
      crmDateApprove: DateTime.tryParse(json["crm_date_approve"] ?? ""),
      crmUserDisapprove: json["crm_user_disapprove"],
      crmDateDisapprove: json["crm_date_disapprove"],
      name: json["name"],
      userid: json["userid"],
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
      trandNo: json["trand_no"],
      trandType: json["trand_type"],
      isVendor: json["is_vendor"],
      subpointsCount: json["subpoints_count"],
      mainpointCount: json["mainpoint_count"],
      typeName: json["type_name"],
      attachments: json["attachments"] == null
          ? []
          : List<dynamic>.from(json["attachments"]!.map((x) => x)),
      projectName: json["project_name"],
      addedfromName: json["addedfrom_name"],
    );
  }
}

class TypeNameModel {
  List<DataTypeName>? dataTypeName;

  TypeNameModel({this.dataTypeName});
}

class DataTypeName {
  double? id;
  String? name;

  DataTypeName({this.id, this.name});
}
