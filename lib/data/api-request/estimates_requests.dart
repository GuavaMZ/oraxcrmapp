import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class EstimatesRequests {
  Dio dio = Dio();

  Future getEstimates(Map<String, dynamic> header) async {
    Response response;
    try {
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getEstimates,
          options: Options(
            method: 'GET',
            headers: header,
          ));
      //dio.Options(headers: {'Authorization': tokenn,
      //   print("\nresponse.statusCode \n${response.statusCode}\n");
      //   print("\nresponse.body\nresponse.body ${response.data}\n");
      // print(urlBaseMy + url);
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        // print("خروج من الريسبونس ");
        response = error.response!;
        return response;
      }
    }
  }

  Future getEstimatesDetails(Map<String, dynamic> header, String id) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(
          ApiLinks.baseUrl + ApiLinks.getEstimatesDetailsById + id,
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
