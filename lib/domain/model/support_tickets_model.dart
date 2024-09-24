class SupportTicketsModel {
  bool? status;
  List<Dataticket>? dataticket;
  String? message;

  SupportTicketsModel({this.status, this.dataticket, this.message});

  SupportTicketsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != String) {
      dataticket = <Dataticket>[];
      json['data'].forEach((v) {
        dataticket!.add(Dataticket.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dataticket != String) {
      data['data'] = dataticket!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Dataticket {
  String? ticketid;
  String? adminreplying;
  String? status;
  String? subject;

  String? lastreply;

  String? priorityid;
  String? fromName;
  String? ticketEmail;
  String? departmentName;
  String? priorityName;
  String? serviceName;
  String? statusName;

  String? projectName;

  Dataticket(
      {this.ticketid,
        this.adminreplying,

        this.subject,
        this.status,
        this.lastreply,

        this.priorityid,
        this.fromName,
        this.ticketEmail,
        this.departmentName,
        this.priorityName,
        this.serviceName,
        this.statusName,

        this.projectName});

  Dataticket.fromJson(Map<String, dynamic> json) {
    ticketid = json['ticketid'];
    adminreplying = json['adminreplying'];

    subject = json['subject'];

    lastreply = json['lastreply'];
    status = json['status'];
    priorityid = json['priorityid'];
    fromName = json['from_name'];
    ticketEmail = json['ticket_email'];
    departmentName = json['department_name'];
    priorityName = json['priority_name'];
    serviceName = json['service_name'];
    statusName = json['status_name'];

    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketid'] = ticketid;
    data['adminreplying'] = adminreplying;

    data['subject'] = subject;

    data['lastreply'] = lastreply;
    data['status'] = status;
    data['priorityid'] = priorityid;
    data['from_name'] = fromName;
    data['ticket_email'] = ticketEmail;
    data['department_name'] = departmentName;
    data['priority_name'] = priorityName;
    data['service_name'] = serviceName;
    data['status_name'] = statusName;

    data['project_name'] = projectName;
    return data;
  }
}



class ResultModel {
  bool? status;
  String? message;
  String? ticketid;

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

