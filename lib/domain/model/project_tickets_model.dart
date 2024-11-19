class ProjectTicketsModel {
  bool? status;
  List<DataTicketsProject>? dataTicketsProject;

  ProjectTicketsModel({this.status, this.dataTicketsProject});

  ProjectTicketsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataTicketsProject = <DataTicketsProject>[];
      json['data'].forEach((v) {
        dataTicketsProject!.add(DataTicketsProject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dataTicketsProject != null) {
      data['data'] = dataTicketsProject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTicketsProject {
  String? ticketid;
  String? adminreplying;
  String? userid;
  String? contactid;
  String? mergedTicketId;
  String? email;
  String? name;
  String? department;
  String? priority;
  String? status;
  String? service;
  String? ticketkey;
  String? subject;
  String? message;
  String? admin;
  String? date;
  String? projectId;
  String? lastreply;
  String? clientread;
  String? adminread;
  String? assigned;
  String? staffIdReplying;
  String? cc;

  DataTicketsProject(
      {this.ticketid,
      this.adminreplying,
      this.userid,
      this.contactid,
      this.mergedTicketId,
      this.email,
      this.name,
      this.department,
      this.priority,
      this.status,
      this.service,
      this.ticketkey,
      this.subject,
      this.message,
      this.admin,
      this.date,
      this.projectId,
      this.lastreply,
      this.clientread,
      this.adminread,
      this.assigned,
      this.staffIdReplying,
      this.cc});

  DataTicketsProject.fromJson(Map<String, dynamic> json) {
    ticketid = json['ticketid'];
    adminreplying = json['adminreplying'];
    userid = json['userid'];
    contactid = json['contactid'];
    mergedTicketId = json['merged_ticket_id'];
    email = json['email'];
    name = json['name'];
    department = json['department'];
    priority = json['priority'];
    status = json['status'];
    service = json['service'];
    ticketkey = json['ticketkey'];
    subject = json['subject'];
    message = json['message'];
    admin = json['admin'];
    date = json['date'];
    projectId = json['project_id'];
    lastreply = json['lastreply'];
    clientread = json['clientread'];
    adminread = json['adminread'];
    assigned = json['assigned'];
    staffIdReplying = json['staff_id_replying'];
    cc = json['cc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketid'] = ticketid;
    data['adminreplying'] = adminreplying;
    data['userid'] = userid;
    data['contactid'] = contactid;
    data['merged_ticket_id'] = mergedTicketId;
    data['email'] = email;
    data['name'] = name;
    data['department'] = department;
    data['priority'] = priority;
    data['status'] = status;
    data['service'] = service;
    data['ticketkey'] = ticketkey;
    data['subject'] = subject;
    data['message'] = message;
    data['admin'] = admin;
    data['date'] = date;
    data['project_id'] = projectId;
    data['lastreply'] = lastreply;
    data['clientread'] = clientread;
    data['adminread'] = adminread;
    data['assigned'] = assigned;
    data['staff_id_replying'] = staffIdReplying;
    data['cc'] = cc;
    return data;
  }
}
