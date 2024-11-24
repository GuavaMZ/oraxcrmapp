// ignore_for_file: prefer_void_to_null

class ProposalsModel {
  bool? status;
  List<ProposalsData>? data;
  String? message;

  ProposalsModel({this.status, this.data, this.message});

  ProposalsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ProposalsData>[];
      json['data'].forEach((v) {
        data!.add(ProposalsData.fromJson(v));
      });
    }
    message = json['message'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['status'] = status;
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   data['message'] = message;
  //   return data;
  // }
}

class ProposalsData {
  ProposalsData({
    this.id,
    this.subject,
    this.content,
    this.date,
    this.addedFrom,
    this.dateCreated,
    this.total,
    this.subTotal,
    this.totalTax,
    this.adjusment,
    this.discountPercent,
    this.discountTotal,
    this.discountType,
    this.showQuantityAs,
    this.currency,
    this.openTill,
    this.relId,
    this.relType,
    this.assigned,
    this.hash,
    this.proposalTo,
    this.projectId,
    this.country,
    this.state,
    this.city,
    this.address,
    this.zip,
    this.phone,
    this.email,
    this.allowComments,
    this.status,
    this.estimateId,
    this.invoiceId,
    this.dateConverted,
    this.pipelineOrder,
    this.isExpiryNotified,
    this.acceptanceFirstName,
    this.acceptanceLastName,
    this.acceptanceEmail,
    this.acceptanceDate,
    this.acceptanceIP,
    this.signature,
    this.shortLink,
    this.symbol,
    this.decimalSeparator,
    this.thousandSeparator,
    this.placement,
    this.isDefault,
    this.currencyID,
    this.currencyName,
    this.clientName,
    this.projectName,
    this.addedFromName,
    this.statusName,
  });

  String? id;
  String? subject;
  String? content;
  String? addedFrom;
  String? dateCreated;
  String? total;
  String? subTotal;
  String? totalTax;
  String? adjusment;
  String? discountPercent;
  String? discountTotal;
  String? discountType;
  String? showQuantityAs;
  String? currency;
  String? openTill;
  String? date;
  String? relId;
  String? relType;
  String? assigned;
  String? hash;
  String? proposalTo;
  String? projectId;
  String? country;
  String? state;
  String? city;
  String? address;
  String? zip;
  String? phone;
  String? email;
  String? allowComments;
  String? status;
  String? estimateId;
  String? invoiceId;
  String? dateConverted;
  String? pipelineOrder;
  String? isExpiryNotified;
  String? acceptanceFirstName;
  String? acceptanceLastName;
  String? acceptanceEmail;
  String? acceptanceDate;
  String? acceptanceIP;
  String? signature;
  String? shortLink;
  String? symbol;
  String? name;
  String? decimalSeparator;
  String? thousandSeparator;
  String? placement;
  String? isDefault;
  String? currencyID;
  String? currencyName;
  String? clientName;
  String? projectName;
  String? addedFromName;
  String? statusName;

  ProposalsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    content = json['content'];
    addedFrom = json['addedfrom'];
    dateCreated = json['datecreated'];
    total = json['total'];
    subTotal = json['subtotal'];
    totalTax = json['total_tax'];
    adjusment = json['adjusment'];
    discountPercent = json['discount_percent'];
    discountTotal = json['discount_total'];
    discountType = json['discount_type'];
    showQuantityAs = json['show_quantity_as'];
    currency = json['currency'];
    openTill = json['open_till'];
    date = json['date'];
    relId = json['rel_id'];
    relType = json['rel_type'];
    assigned = json['assigned'];
    hash = json['hash'];
    proposalTo = json['proposal_to'];
    projectId = json['project_id'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    zip = json['zip'];
    phone = json['phone'];
    email = json['email'];
    allowComments = json['allow_comments'];
    status = json['status'];
    estimateId = json['estimate_id'];
    invoiceId = json['invoice_id'];
    dateConverted = json['date_converted'];
    pipelineOrder = json['pipeline_order'];
    isExpiryNotified = json['is_expiry_notified'];
    acceptanceFirstName = json['acceptance_firstname'];
    acceptanceLastName = json['acceptance_lastname'];
    acceptanceEmail = json['acceptance_email'];
    acceptanceDate = json['acceptance_date'];
    acceptanceIP = json['acceptance_ip'];
    signature = json['signature'];
    shortLink = json['short_link'];
    symbol = json['symbol'];
    decimalSeparator = json['decimal_separator'];
    thousandSeparator = json['thousand_separator'];
    placement = json['placement'];
    isDefault = json['isdefault'];
    currencyID = json['currencyID'];
    currencyName = json['currency_name'];
    clientName = json['client_name'];
    projectName = json['project_name'];
    addedFromName = json['added_from_name'];
    statusName = json['status_name'];
  }
}
