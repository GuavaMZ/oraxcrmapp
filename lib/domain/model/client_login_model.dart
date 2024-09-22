class LoginModel {
  bool? status;
  DataLogin? datalogin;
  String? message;

  LoginModel({this.status, this.datalogin, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    datalogin = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (datalogin != null) {
      data['data'] = datalogin!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class DataLogin {
  String? clientId;
  String? contactId;
  bool? clientLoggedIn;
  int? aPITIME;
  Client? client;
  Company? company;
  String? token;

  DataLogin(
      {this.clientId,
        this.contactId,
        this.clientLoggedIn,
        this.aPITIME,
        this.client,
        this.company,
        this.token});

  DataLogin.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    contactId = json['contact_id'];
    clientLoggedIn = json['client_logged_in'];
    aPITIME = json['API_TIME'];
    client =
    json['client'] != null ? Client.fromJson(json['client']) : null;
    company =
    json['company'] != null ? Company.fromJson(json['company']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_id'] = clientId;
    data['contact_id'] = contactId;
    data['client_logged_in'] = clientLoggedIn;
    data['API_TIME'] = aPITIME;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Client {
  String? userid;
  String? id;
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? title;
  String? lastIp;
  String? lastLogin;
  String? lastPasswordChange;
  String? profileImage;

  Client(
      {this.userid,
        this.id,
        this.firstname,
        this.lastname,
        this.phonenumber,
        this.title,
        this.lastIp,
        this.lastLogin,
        this.lastPasswordChange,
        this.profileImage});

  Client.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phonenumber = json['phonenumber'];
    title = json['title'];
    lastIp = json['last_ip'];
    lastLogin = json['last_login'];
    lastPasswordChange = json['last_password_change'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phonenumber'] = phonenumber;
    data['title'] = title;
    data['last_ip'] = lastIp;
    data['last_login'] = lastLogin;
    data['last_password_change'] = lastPasswordChange;
    data['profile_image'] = profileImage;
    return data;
  }
}

class Company {
  String? company;
  String? address;
  String? city;
  String? phonenumber;
  String? country;

  Company(
      {this.company, this.address, this.city, this.phonenumber, this.country});

  Company.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    address = json['address'];
    city = json['city'];
    phonenumber = json['phonenumber'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company'] = company;
    data['address'] = address;
    data['city'] = city;
    data['phonenumber'] = phonenumber;
    data['country'] = country;
    return data;
  }
}
