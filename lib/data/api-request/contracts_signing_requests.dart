import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class ContractsSigningRequests {
  Dio dio = Dio();
  Future getSignCode(Map<String, dynamic> header, String contractID) async {
    Response response;
    try {
      response = await dio.get(
          '${ApiLinks.baseUrl}${ApiLinks.getSignCode}?id=$contractID',
          options: Options(
            method: 'GET',
            headers: header,
          ));
          print(response);
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        // print("خروج من الريسبونس ");
        response = error.response!;
        return response;
      }
    }
  }

  Future checkSignCode(
      Map<String, dynamic> header, String contractID, String code) async {
    Response response;
    try {
      response = await dio.get(
          '${ApiLinks.baseUrl}${ApiLinks.checkSignCode}?id=$contractID&code=$code',
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

  Future signContract(
      {required Map<String, dynamic> header,
      required Map<String, dynamic> body}) async {
    try {
      final Response response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.signContract,
        options: Options(headers: header),
        data: body,
        /*onSendProgress: (count, total) =>
            Center(child: CircularProgressIndicator()*/
      );
      return response;
    } on DioException catch (error) {
      // print(error);
      if (error.response != null) {
        // response = error.response!;
        return error.response;
      }
    }
  }
}
