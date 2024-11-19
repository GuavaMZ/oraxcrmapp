class TicketsPriortiesModel {
  bool? status;
  List<TicketsPriortiesData>? ticketsPriortiesData;
  String? message;

  TicketsPriortiesModel({this.status, this.ticketsPriortiesData, this.message});

  TicketsPriortiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != String) {
      ticketsPriortiesData = <TicketsPriortiesData>[];
      json['data'].forEach((v) {
        ticketsPriortiesData!.add(TicketsPriortiesData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (ticketsPriortiesData != String) {
      data['data'] = ticketsPriortiesData!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class TicketsPriortiesData {
  String? priorityid;
  String? name;

  TicketsPriortiesData({this.priorityid, this.name});

  TicketsPriortiesData.fromJson(Map<String, dynamic> json) {
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
