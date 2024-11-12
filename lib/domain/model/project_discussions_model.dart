class DiscussionsProjectModel {
  bool? status;
  List<DataDiscussions>? dataDiscussions;

  DiscussionsProjectModel({this.status, this.dataDiscussions});

  DiscussionsProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataDiscussions = <DataDiscussions>[];
      json['data'].forEach((v) {
        dataDiscussions!.add(DataDiscussions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dataDiscussions != null) {
      data['data'] = dataDiscussions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDiscussions {
  String? id;
  String? projectId;
  String? subject;
  String? description;
  String? showToCustomer;
  String? datecreated;
  String? lastActivity;
  String? staffId;
  String? contactId;
  int? totalComments;

  DataDiscussions(
      {this.id,
      this.projectId,
      this.subject,
      this.description,
      this.showToCustomer,
      this.datecreated,
      this.lastActivity,
      this.staffId,
      this.contactId,
      this.totalComments});

  DataDiscussions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    subject = json['subject'];
    description = json['description'];
    showToCustomer = json['show_to_customer'];
    datecreated = json['datecreated'];
    lastActivity = json['last_activity'];
    staffId = json['staff_id'];
    contactId = json['contact_id'];
    totalComments = json['total_comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_id'] = projectId;
    data['subject'] = subject;
    data['description'] = description;
    data['show_to_customer'] = showToCustomer;
    data['datecreated'] = datecreated;
    data['last_activity'] = lastActivity;
    data['staff_id'] = staffId;
    data['contact_id'] = contactId;
    data['total_comments'] = totalComments;
    return data;
  }
}
