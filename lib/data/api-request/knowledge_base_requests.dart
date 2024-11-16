import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class KnowledgeBaseRequests {
  Dio dio = Dio();

  Future getKnowledgeBaseArticles(Map<String, dynamic> header) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.knowledgeBase,
          options: Options(
            method: 'GET',
            headers: header,
          ));
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        // print("خروج من الريسبونس ");
        response = error.response!;
        return response;
      }
    }
  }
}
