class FilesProjectModel {
  FilesProjectModel({
    required this.status,
    required this.data,
  });

  final bool? status;
  final List<FilesData> data;

  factory FilesProjectModel.fromJson(Map<String, dynamic> json) {
    return FilesProjectModel(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<FilesData>.from(
              json["data"]!.map((x) => FilesData.fromJson(x))),
    );
  }
}

class FilesData {
  FilesData({
    required this.id,
    required this.fileName,
    required this.originalFileName,
    required this.subject,
    required this.description,
    required this.filetype,
    required this.dateadded,
    required this.lastActivity,
    required this.projectId,
    required this.visibleToCustomer,
    required this.staffid,
    required this.contactId,
    required this.datumExternal,
    required this.externalLink,
    required this.thumbnailLink,
  });

  final String? id;
  final String? fileName;
  final String? originalFileName;
  final String? subject;
  final String? description;
  final String? filetype;
  final DateTime? dateadded;
  final dynamic lastActivity;
  final String? projectId;
  final String? visibleToCustomer;
  final String? staffid;
  final String? contactId;
  final dynamic datumExternal;
  final dynamic externalLink;
  final dynamic thumbnailLink;

  factory FilesData.fromJson(Map<String, dynamic> json) {
    return FilesData(
      id: json["id"],
      fileName: json["file_name"],
      originalFileName: json["original_file_name"],
      subject: json["subject"],
      description: json["description"],
      filetype: json["filetype"],
      dateadded: DateTime.tryParse(json["dateadded"] ?? ""),
      lastActivity: json["last_activity"],
      projectId: json["project_id"],
      visibleToCustomer: json["visible_to_customer"],
      staffid: json["staffid"],
      contactId: json["contact_id"],
      datumExternal: json["external"],
      externalLink: json["external_link"],
      thumbnailLink: json["thumbnail_link"],
    );
  }
}
