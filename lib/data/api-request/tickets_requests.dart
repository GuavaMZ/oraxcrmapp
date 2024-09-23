import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class TicketsRequests {
  Dio dio = Dio();
  Future listAllTickets(Map<String, dynamic> header) async {
    Response response;
    try {
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getTickets,
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
