class FilesModel {
  FilesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  final bool? status;
  final Data? data;
  final String? message;

  factory FilesModel.fromJson(Map<String, dynamic> json) {
    return FilesModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.files,
    required this.attac,
  });

  final List<FileElement> files;
  final String? attac;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      files: json["files"] == null
          ? []
          : List<FileElement>.from(
              json["files"]!.map((x) => FileElement.fromJson(x))),
      attac: json["attac"],
    );
  }

  Map<String, dynamic> toJson() => {
        "files": files.map((x) => x.toJson()).toList(),
        "attac": attac,
      };
}

class FileElement {
  FileElement({
    required this.id,
    required this.relId,
    required this.relType,
    required this.fileName,
    required this.filetype,
    required this.visibleToCustomer,
    required this.attachmentKey,
    required this.fileExternal,
    required this.externalLink,
    required this.thumbnailLink,
    required this.staffid,
    required this.contactId,
    required this.taskCommentId,
    required this.dateadded,
    required this.url,
  });

  final String? id;
  final String? relId;
  final String? relType;
  final String? fileName;
  final String? filetype;
  final String? visibleToCustomer;
  final String? attachmentKey;
  final dynamic fileExternal;
  final dynamic externalLink;
  final dynamic thumbnailLink;
  final String? staffid;
  final String? contactId;
  final String? taskCommentId;
  final DateTime? dateadded;
  final String? url;

  factory FileElement.fromJson(Map<String, dynamic> json) {
    return FileElement(
      id: json["id"],
      relId: json["rel_id"],
      relType: json["rel_type"],
      fileName: json["file_name"],
      filetype: json["filetype"],
      visibleToCustomer: json["visible_to_customer"],
      attachmentKey: json["attachment_key"],
      fileExternal: json["external"],
      externalLink: json["external_link"],
      thumbnailLink: json["thumbnail_link"],
      staffid: json["staffid"],
      contactId: json["contact_id"],
      taskCommentId: json["task_comment_id"],
      dateadded: DateTime.tryParse(json["dateadded"] ?? ""),
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "rel_id": relId,
        "rel_type": relType,
        "file_name": fileName,
        "filetype": filetype,
        "visible_to_customer": visibleToCustomer,
        "attachment_key": attachmentKey,
        "external": fileExternal,
        "external_link": externalLink,
        "thumbnail_link": thumbnailLink,
        "staffid": staffid,
        "contact_id": contactId,
        "task_comment_id": taskCommentId,
        "dateadded": dateadded?.toIso8601String(),
        "url": url,
      };
}
