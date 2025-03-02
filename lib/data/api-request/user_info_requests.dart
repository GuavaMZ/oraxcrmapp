import 'package:dio/dio.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class UserInfoRequests {
  Dio dio = Dio();
  Future getUserInfo(Map<String, dynamic> header) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio
          .get(ApiLinks.baseUrl + ApiLinks.getProfileInfo,
              options: Options(
                method: 'GET',
                headers: header,
              ))
          .timeout(Duration(minutes: DataHolders.timeOut));
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
