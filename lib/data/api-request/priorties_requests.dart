import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class PriortiesRequests {
  Dio dio = Dio();
  Future getPriorties(Map<String, dynamic> header) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getPriorties,
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
