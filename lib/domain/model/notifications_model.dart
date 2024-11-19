class NotifcationModel {
  bool? status;
  List<Data>? data;
  String? message;

  NotifcationModel({this.status, this.data, this.message});

  NotifcationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != String) {
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
    if (this.data != String) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? id;
  String? description;
  String? date;
  String? isread;
  String? fromclientid;
  String? fromFullname;
  String? fromcompany;
  String? link;
  String? additionalData;

  Data(
      {this.id,
      this.description,
      this.date,
      this.isread,
      this.fromclientid,
      this.fromFullname,
      this.fromcompany,
      this.link,
      this.additionalData});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    date = json['date'];
    isread = json['isread'];
    fromclientid = json['fromclientid'];
    fromFullname = json['from_fullname'];
    fromcompany = json['fromcompany'];
    link = json['link'];
    additionalData = json['additional_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['date'] = date;
    data['isread'] = isread;
    data['fromclientid'] = fromclientid;
    data['from_fullname'] = fromFullname;
    data['fromcompany'] = fromcompany;
    data['link'] = link;
    data['additional_data'] = additionalData;
    return data;
  }
}
