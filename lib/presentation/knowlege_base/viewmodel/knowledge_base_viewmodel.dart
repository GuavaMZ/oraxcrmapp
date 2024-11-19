import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/knowledge_base_requests.dart';
import 'package:oraxcrm/domain/model/knowledge_base_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KnowledgeBaseViewModel extends ChangeNotifier {
  bool lastPageFlag = false;

  List<ArticlesModel>? articlesGroups = [];

  Future getArticlesGroups(BuildContext context) async {
    KnowledgeBaseRequests knowledgeBaseRequests = KnowledgeBaseRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    KnowledgeBaseModel? knowledgeBaseModel;
    print(prefs.getString('usrToken'));
    if (lastPageFlag == false) {
      try {
        await knowledgeBaseRequests.getKnowledgeBaseArticles(
            {'Authorization': prefs.getString('usrToken')}).then((res) async {
          if (res.statusCode == 200) {
            knowledgeBaseModel = KnowledgeBaseModel.fromJson(res.data);
            articlesGroups!.addAll(knowledgeBaseModel!.data!);
            lastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return knowledgeBaseModel?.data;
      } catch (e) {
        print(e);
      }
    }
  }
}
