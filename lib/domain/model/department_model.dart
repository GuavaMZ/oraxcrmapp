class DepartmentModel {
  bool? status;
  List<Data>? data;
  String? message;

  DepartmentModel({this.status, this.data, this.message});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
class Data {
  String? departmentid;
  String? name;

  Data({this.departmentid, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    departmentid = json['departmentid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentid'] = departmentid;
    data['name'] = name;
    return data;
  }
}


