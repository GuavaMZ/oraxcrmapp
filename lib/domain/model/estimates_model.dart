class EstimatesModel {
  bool? status;
  List<EstimatesData>? data;
  String? message;

  EstimatesModel({this.data, this.status, this.message});

  EstimatesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <EstimatesData>[];
      json['data'].forEach((v) {
        data!.add(EstimatesData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class EstimatesData {
  EstimatesData({
    this.id,
    this.sent,
    this.datesend,
    this.clientId,
    this.deletedCustomerName,
    this.projectId,
    this.number,
    this.prefix,
    this.numberFormat,
    this.hash,
    this.dateCreated,
    this.date,
    this.expiryDate,
    this.currency,
    this.subTotal,
    this.totalTax,
    this.total,
    this.adjustment,
    this.addedFrom,
    this.status,
    this.clientNote,
    this.adminNote,
    this.discountPercent,
    this.discountTotal,
    this.discountType,
    this.invoiceId,
    this.invoicedDate,
    this.terms,
    this.referenceNo,
    this.saleAgent,
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
    this.includeShipping,
    this.showShippingOnEstimate,
    this.showQuantityAs,
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
    this.name,
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
  String? sent;
  String? datesend;
  String? clientId;
  String? deletedCustomerName;
  String? projectId;
  String? number;
  String? prefix;
  String? numberFormat;
  String? hash;
  String? dateCreated;
  String? date;
  String? expiryDate;
  String? currency;
  String? subTotal;
  String? totalTax;
  String? total;
  String? adjustment;
  String? addedFrom;
  String? status;
  String? clientNote;
  String? adminNote;
  String? discountPercent;
  String? discountTotal;
  String? discountType;
  String? invoiceId;
  String? invoicedDate;
  String? terms;
  String? referenceNo;
  String? saleAgent;
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
  String? includeShipping;
  String? showShippingOnEstimate;
  String? showQuantityAs;
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

  EstimatesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sent = json['sent'];
    datesend = json['datesend'];
    clientId = json['clientid'];
    deletedCustomerName = json['deleted_customer_name'];
    projectId = json['project_id'];
    number = json['number'];
    prefix = json['prefix'];
    numberFormat = json['number_format'];
    hash = json['hash'];
    dateCreated = json['date_created'];
    date = json['date'];
    expiryDate = json['expirydate'];
    currency = json['currency'];
    subTotal = json['subtotal'];
    totalTax = json['total_tax'];
    total = json['total'];
    adjustment = json['adjustment'];
    addedFrom = json['addedfrom'];
    status = json['status'];
    clientNote = json['clientnote'];
    adminNote = json['adminnote'];
    discountPercent = json['discount_percent'];
    discountTotal = json['discount_total'];
    discountType = json['discount_type'];
    invoiceId = json['invoiceid'];
    invoicedDate = json['invoiced_date'];
    terms = json['terms'];
    referenceNo = json['reference_no'];
    saleAgent = json['sale_agent'];
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
    includeShipping = json['include_shipping'];
    showShippingOnEstimate = json['show_shipping_on_estimate'];
    showQuantityAs = json['show_quantity_as'];
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
