import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class ContractsRequests {
  Dio dio = Dio();

  Future getContracts(Map<String, dynamic> header) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getContracts,
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

  Future getContractDetails(
      Map<String, dynamic> header, String contractId) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(
          ApiLinks.baseUrl + ApiLinks.getContractDetailById + contractId,
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
