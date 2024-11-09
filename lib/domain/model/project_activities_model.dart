class ActiveProjectModel {
  bool? status;
  List<DataActiveProject>? dataActiveProject;

  ActiveProjectModel({this.status, this.dataActiveProject});

  ActiveProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataActiveProject = <DataActiveProject>[];
      json['data'].forEach((v) {
        dataActiveProject!.add(new DataActiveProject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dataActiveProject != null) {
      data['data'] = this.dataActiveProject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataActiveProject {
  String? id;
  String? projectId;
  String? staffId;
  String? contactId;
  String? fullname;
  String? visibleToCustomer;
  String? additionalData;
  String? dateadded;
  String? description;
  String? projectName;

  DataActiveProject(
      {this.id,
        this.projectId,
        this.staffId,
        this.contactId,
        this.fullname,
        this.visibleToCustomer,
        this.additionalData,
        this.dateadded,
        this.description,
        this.projectName});

  DataActiveProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    staffId = json['staff_id'];
    contactId = json['contact_id'];
    fullname = json['fullname'];
    visibleToCustomer = json['visible_to_customer'];
    additionalData = json['additional_data'];
    dateadded = json['dateadded'];
    description = json['description'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['staff_id'] = this.staffId;
    data['contact_id'] = this.contactId;
    data['fullname'] = this.fullname;
    data['visible_to_customer'] = this.visibleToCustomer;
    data['additional_data'] = this.additionalData;
    data['dateadded'] = this.dateadded;
    data['description'] = this.description;
    data['project_name'] = this.projectName;
    return data;
  }
}
