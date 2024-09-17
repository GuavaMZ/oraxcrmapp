import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class ProjectsRequests {
  Dio dio = Dio();

  Future getProjects(Map<String, dynamic> header) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getProjects,
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

  Future getProjectsDetails(Map<String, dynamic> header,String id) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getProjects + id,
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
