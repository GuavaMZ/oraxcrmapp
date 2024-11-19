class UserDataModel {
  UserDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  final bool? status;
  final ClientData? data;
  final String? message;

  factory UserDataModel.fromJson(Map<String, dynamic> json){
    return UserDataModel(
      status: json["status"],
      data: json["data"] == null ? null : ClientData.fromJson(json["data"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };

}

class Data {
  Data({
    required this.clientId,
    required this.contactId,
    required this.clientLoggedIn,
    required this.apiTime,
    required this.client,
    required this.company,
    required this.groups,
    required this.relationdata,
  });

  final String? clientId;
  final String? contactId;
  final bool? clientLoggedIn;
  final int? apiTime;
  final Client? client;
  final Company? company;
  final List<Group> groups;
  final Relationdata? relationdata;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      clientId: json["client_id"],
      contactId: json["contact_id"],
      clientLoggedIn: json["client_logged_in"],
      apiTime: json["API_TIME"],
      client: json["client"] == null ? null : Client.fromJson(json["client"]),
      company: json["company"] == null ? null : Company.fromJson(json["company"]),
      groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
      relationdata: json["relationdata"] == null ? null : Relationdata.fromJson(json["relationdata"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "contact_id": contactId,
    "client_logged_in": clientLoggedIn,
    "API_TIME": apiTime,
    "client": client?.toJson(),
    "company": company?.toJson(),
    "groups": groups.map((x) => x.toJson()).toList(),
    "relationdata": relationdata?.toJson(),
  };

}

class Client {
  Client({
    required this.userid,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.title,
    required this.lastIp,
    required this.lastLogin,
    required this.lastPasswordChange,
    required this.profileImage,
    required this.email,
  });

  final String? userid;
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? phonenumber;
  final String? title;
  final String? lastIp;
  final DateTime? lastLogin;
  final DateTime? lastPasswordChange;
  final dynamic profileImage;
  final String? email;

  factory Client.fromJson(Map<String, dynamic> json){
    return Client(
      userid: json["userid"],
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      phonenumber: json["phonenumber"],
      title: json["title"],
      lastIp: json["last_ip"],
      lastLogin: DateTime.tryParse(json["last_login"] ?? ""),
      lastPasswordChange: DateTime.tryParse(json["last_password_change"] ?? ""),
      profileImage: json["profile_image"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "phonenumber": phonenumber,
    "title": title,
    "last_ip": lastIp,
    "last_login": lastLogin?.toIso8601String(),
    "last_password_change": lastPasswordChange?.toIso8601String(),
    "profile_image": profileImage,
    "email": email,
  };

}

class Company {
  Company({
    required this.company,
    required this.address,
    required this.city,
    required this.phonenumber,
    required this.country,
  });

  final String? company;
  final String? address;
  final String? city;
  final String? phonenumber;
  final String? country;

  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      company: json["company"],
      address: json["address"],
      city: json["city"],
      phonenumber: json["phonenumber"],
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() => {
    "company": company,
    "address": address,
    "city": city,
    "phonenumber": phonenumber,
    "country": country,
  };

}

class Group {
  Group({
    required this.id,
    required this.groupid,
    required this.customerId,
  });

  final String? id;
  final String? groupid;
  final String? customerId;

  factory Group.fromJson(Map<String, dynamic> json){
    return Group(
      id: json["id"],
      groupid: json["groupid"],
      customerId: json["customer_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "groupid": groupid,
    "customer_id": customerId,
  };

}

class Relationdata {
  Relationdata({
    required this.theOwner,
    required this.tentacled,
    required this.fluffy,
    required this.purple,
    required this.relationdata,
    required this.empty,
  });

  final String? theOwner;
  final String? tentacled;
  final DateTime? fluffy;
  final DateTime? purple;
  final String? relationdata;
  final String? empty;

  factory Relationdata.fromJson(Map<String, dynamic> json){
    return Relationdata(
      theOwner: json["مالك المنشئة (الكفيل) | The owner"],
      tentacled: json["رقم الهوية"],
      fluffy: DateTime.tryParse(json["تاريخ البداء للعميل"] ?? ""),
      purple: DateTime.tryParse(json["تاريخ الانتهاء"] ?? ""),
      relationdata: json["المقيم في"],
      empty: json[" حي"],
    );
  }

  Map<String, dynamic> toJson() => {
    "مالك المنشئة (الكفيل) | The owner": theOwner,
    "رقم الهوية": tentacled,
    "تاريخ البداء للعميل": "${fluffy!.year.toString().padLeft(4)}-${fluffy!.month.toString().padLeft(2)}-${fluffy!.day.toString().padLeft(2)}",
    "تاريخ الانتهاء": "${purple!.year.toString().padLeft(4)}-${purple!.month.toString().padLeft(2)}-${purple!.day.toString().padLeft(2)}",
    "المقيم في": relationdata,
    " حي": empty,
  };

}



class ImageModel {
  bool? status;
  String? message;

  ImageModel({this.status, this.message});

  ImageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}




// Written By Zeyad
class ClientData {
  ClientData({
    required this.userid,
    required this.id,
    required this.isprimary,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.title,
    required this.lastIp,
    required this.lastLogin,
    required this.lastPasswordChange,
    required this.profileImage,
    required this.email,
  });

  final String? userid;
  final String? id;
  final String? isprimary;
  final String? firstname;
  final String? lastname;
  final String? phonenumber;
  final String? title;
  final String? lastIp;
  final DateTime? lastLogin;
  final DateTime? lastPasswordChange;
  final dynamic profileImage;
  final String? email;

  factory ClientData.fromJson(Map<String, dynamic> json){
    return ClientData(
      userid: json["userid"],
      id: json["id"],
      isprimary: json['is_primary'], 
      firstname: json["firstname"],
      lastname: json["lastname"],
      phonenumber: json["phonenumber"],
      title: json["title"],
      lastIp: json["last_ip"],
      lastLogin: DateTime.tryParse(json["last_login"] ?? ""),
      lastPasswordChange: DateTime.tryParse(json["last_password_change"] ?? ""),
      profileImage: json["profile_image"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "phonenumber": phonenumber,
    "title": title,
    "last_ip": lastIp,
    "last_login": lastLogin?.toIso8601String(),
    "last_password_change": lastPasswordChange?.toIso8601String(),
    "profile_image": profileImage,
    "email": email,
  };

}
