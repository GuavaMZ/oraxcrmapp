class PriortyModel {
  bool? status;
  List<DataPriorty>? dataPriorty;
  String? message;

  PriortyModel({this.status, this.dataPriorty, this.message});

  PriortyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataPriorty = <DataPriorty>[];
      json['data'].forEach((v) {
        dataPriorty!.add(DataPriorty.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dataPriorty != null) {
      data['data'] = dataPriorty!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DataPriorty {
  String? priorityid;
  String? name;

  DataPriorty({this.priorityid, this.name});

  DataPriorty.fromJson(Map<String, dynamic> json) {
    priorityid = json['priorityid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priorityid'] = priorityid;
    data['name'] = name;
    return data;
  }
}
