class ProjectStateModel {
  List<ProjectStateList>? projectStatList;

  ProjectStateModel({this.projectStatList});

  ProjectStateModel.fromJson(Map<String, dynamic> json) {
    if (json['projectStatList'] != null) {
      projectStatList = <ProjectStateList>[];
      json['projectStatList'].forEach((v) {
        projectStatList!.add(ProjectStateList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (projectStatList != null) {
      data['projectStatList'] =
          projectStatList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectStateList {
  int? id;
  String? name;

  ProjectStateList({this.id, this.name});

  ProjectStateList.fromJson(Map<String, dynamic> json) {
    id = json['branchId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
