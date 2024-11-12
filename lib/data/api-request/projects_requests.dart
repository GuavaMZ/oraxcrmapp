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

  Future getProjectsDetails(Map<String, dynamic> header, String id) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response =
          await dio.get(ApiLinks.baseUrl + ApiLinks.getProjectDetailsById + id,
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

  Future getProjectTasks(Map<String, dynamic> header, String id) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(
          "${ApiLinks.baseUrl}${ApiLinks.getProjects}/id/$id/group/tasks",
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

  Future getProjectTickets(Map<String, dynamic> header, String id) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(
          "${ApiLinks.baseUrl}${ApiLinks.getProjectTickets}?project_id=$id",
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

  Future getProjectActivities(Map<String, dynamic> header, String id) async {
    Response response;
    try {
      response = await dio.get(
          ApiLinks.baseUrl +
              ApiLinks.getProjectActivities +
              "?project_id=" +
              id,
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
