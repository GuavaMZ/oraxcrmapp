import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class LoginRequest {
  Dio dio = Dio();
  Future login(
      {required Map<String, dynamic> header,
      required Map<String, dynamic> body}) async {
    try {
      final Response response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.login,
        options: Options(headers: header),
        data: FormData.fromMap(body),
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

  Future logout(
      {required Map<String, dynamic> header,
      required Map<String, dynamic> body}) async {
    try {
      final Response response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.logout,
        options: Options(headers: header),
        data: FormData.fromMap(body),
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
