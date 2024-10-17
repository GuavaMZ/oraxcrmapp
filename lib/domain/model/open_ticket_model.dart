class OpenTicketsModel {
  DataProfile? dataProfile;

  OpenTicketsModel({this.dataProfile});

  OpenTicketsModel.fromJson(Map<String, dynamic> json) {
    dataProfile = json['dataProfile'] != null
        ? DataProfile.fromJson(json['dataProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataProfile != null) {
      data['dataProfile'] = dataProfile!.toJson();
    }
    return data;
  }
}

class DataProfile {
  int? userId;
  String? userFullname;
  String? userEmail;
  String? userName;
  String? userPassword;
  int? userTypeId;
  String? photo;
  String? electronicSignatureImag;

  DataProfile(
      {this.userId,
      this.userFullname,
      this.userEmail,
      this.userName,
      this.userPassword,
      this.userTypeId,
      this.photo,
      this.electronicSignatureImag});

  DataProfile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userFullname = json['userFullname'];
    userEmail = json['userEmail'];
    userName = json['userName'];
    userPassword = json['userPassword'];
    userTypeId = json['userTypeId'];
    photo = json['photo'];
    electronicSignatureImag = json['electronicSignatureImag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userFullname'] = userFullname;
    data['userEmail'] = userEmail;
    data['userName'] = userName;
    data['userPassword'] = userPassword;
    data['userTypeId'] = userTypeId;
    data['photo'] = photo;
    data['electronicSignatureImag'] = electronicSignatureImag;
    return data;
  }
}

class ResultModel {
  bool? status;
  String? message;
  int? ticketid;

  ResultModel({this.status, this.message, this.ticketid});

  ResultModel.fromJson(Map<String, dynamic> json) {
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
