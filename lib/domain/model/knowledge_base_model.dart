class KnowledgeBaseModel {
  KnowledgeBaseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  final bool? status;
  final List<ArticlesModel>? data;
  final String? message;

  factory KnowledgeBaseModel.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseModel(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<ArticlesModel>.from(
              json["data"]!.map((x) => ArticlesModel.fromJson(x))),
      message: json["message"],
    );
  }
}

class ArticlesModel {
  ArticlesModel(
      {required this.groupId,
      required this.name,
      required this.groupSlug,
      required this.description,
      required this.active,
      required this.color,
      required this.groupOrder,
      required this.articles});
  String? groupId;
  String? name;
  String? groupSlug;
  String? description;
  String? active;
  String? color;
  String? groupOrder;
  List<ArticlesData>? articles;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
        groupId: json["groudid"],
        name: json["name"],
        groupSlug: json["group_slug"],
        description: json["description"],
        active: json["active"],
        color: json["color"],
        groupOrder: json["group_order"],
        articles: json["articles"] == null
            ? []
            : List<ArticlesData>.from(
                json["articles"]!.map((x) => ArticlesData.fromJson(x))));
  }
}

class ArticlesData {
  ArticlesData(
      {required this.slug,
      required this.subject,
      required this.fileName,
      required this.description,
      required this.activeArticle,
      required this.articleGroup,
      required this.articleId,
      required this.staffArticle});

  String? slug;
  String? subject;
  String? fileName;
  String? description;
  String? activeArticle;
  String? articleGroup;
  String? articleId;
  String? staffArticle;

  factory ArticlesData.fromJson(Map<String, dynamic> json) {
    return ArticlesData(
        slug: json["slug"],
        subject: json["subject"],
        fileName: json["file_name"],
        description: json["description"],
        activeArticle: json["active_article"],
        articleGroup: json["articlegroup"],
        articleId: json["articleid"],
        staffArticle: json["staff_article"]);
  }
}
