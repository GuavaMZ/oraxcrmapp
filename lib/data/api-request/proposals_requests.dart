import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class ProposalsRequests {
  Dio dio = Dio();

  Future addProposalsComment(
      {required Map<String, dynamic> header,
      required Map<String, dynamic> body}) async {
    try {
      final response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.addProposalsComment,
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

  Future getProposals(Map<String, dynamic> header) async {
    Response response;
    try {
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getProposals,
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

  Future getProposalsDetails(Map<String, dynamic> header,String id) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(ApiLinks.baseUrl + ApiLinks.getProposalsDetailsById + id,
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
