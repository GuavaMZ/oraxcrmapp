class ProjectTasksModel {
  bool? status;
  List<DataTasksProject>? dataTasksProject;
  ProjectTasksModel({this.status, this.dataTasksProject});
  ProjectTasksModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != String) {
      dataTasksProject = <DataTasksProject>[];
      json['data'].forEach((v) {
        dataTasksProject!.add(DataTasksProject.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dataTasksProject != String) {
      data['data'] = dataTasksProject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTasksProject {
  String? id;
  String? name;
  String? description;
  String? priority;
  String? dateadded;
  String? startdate;
  String? duedate;
  String? datefinished;
  String? addedfrom;
  String? isAddedFromContact;
  String? status;
  String? recurringType;
  String? repeatEvery;
  String? recurring;
  String? isRecurringFrom;
  String? cycles;
  String? totalCycles;
  String? customRecurring;
  String? lastRecurringDate;
  String? relId;
  String? relType;
  String? isPublic;
  String? billable;
  String? billed;
  String? invoiceId;
  String? hourlyRate;
  String? milestone;
  String? kanbanOrder;
  String? milestoneOrder;
  String? visibleToClient;
  String? deadlineNotified;
  String? wpWasNotfy;

  DataTasksProject(
      {this.id,
        this.name,
        this.description,
        this.priority,
        this.dateadded,
        this.startdate,
        this.duedate,
        this.datefinished,
        this.addedfrom,
        this.isAddedFromContact,
        this.status,
        this.recurringType,
        this.repeatEvery,
        this.recurring,
        this.isRecurringFrom,
        this.cycles,
        this.totalCycles,
        this.customRecurring,
        this.lastRecurringDate,
        this.relId,
        this.relType,
        this.isPublic,
        this.billable,
        this.billed,
        this.invoiceId,
        this.hourlyRate,
        this.milestone,
        this.kanbanOrder,
        this.milestoneOrder,
        this.visibleToClient,
        this.deadlineNotified,
        this.wpWasNotfy});

  DataTasksProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    priority = json['priority'];
    dateadded = json['dateadded'];
    startdate = json['startdate'];
    duedate = json['duedate'];
    datefinished = json['datefinished'];
    addedfrom = json['addedfrom'];
    isAddedFromContact = json['is_added_from_contact'];
    status = json['status'];
    recurringType = json['recurring_type'];
    repeatEvery = json['repeat_every'];
    recurring = json['recurring'];
    isRecurringFrom = json['is_recurring_from'];
    cycles = json['cycles'];
    totalCycles = json['total_cycles'];
    customRecurring = json['custom_recurring'];
    lastRecurringDate = json['last_recurring_date'];
    relId = json['rel_id'];
    relType = json['rel_type'];
    isPublic = json['is_public'];
    billable = json['billable'];
    billed = json['billed'];
    invoiceId = json['invoice_id'];
    hourlyRate = json['hourly_rate'];
    milestone = json['milestone'];
    kanbanOrder = json['kanban_order'];
    milestoneOrder = json['milestone_order'];
    visibleToClient = json['visible_to_client'];
    deadlineNotified = json['deadline_notified'];
    wpWasNotfy = json['wp_was_notfy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['priority'] = priority;
    data['dateadded'] = dateadded;
    data['startdate'] = startdate;
    data['duedate'] = duedate;
    data['datefinished'] = datefinished;
    data['addedfrom'] = addedfrom;
    data['is_added_from_contact'] = isAddedFromContact;
    data['status'] = status;
    data['recurring_type'] = recurringType;
    data['repeat_every'] = repeatEvery;
    data['recurring'] = recurring;
    data['is_recurring_from'] = isRecurringFrom;
    data['cycles'] = cycles;
    data['total_cycles'] = totalCycles;
    data['custom_recurring'] = customRecurring;
    data['last_recurring_date'] = lastRecurringDate;
    data['rel_id'] = relId;
    data['rel_type'] = relType;
    data['is_public'] = isPublic;
    data['billable'] = billable;
    data['billed'] = billed;
    data['invoice_id'] = invoiceId;
    data['hourly_rate'] = hourlyRate;
    data['milestone'] = milestone;
    data['kanban_order'] = kanbanOrder;
    data['milestone_order'] = milestoneOrder;
    data['visible_to_client'] = visibleToClient;
    data['deadline_notified'] = deadlineNotified;
    data['wp_was_notfy'] = wpWasNotfy;
    return data;
  }
}
