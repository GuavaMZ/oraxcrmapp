import 'package:dio/dio.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class OpenTicketRequests {
  Dio dio = Dio();
  // Future addReply(String ticketId,
  //     {required Map<String, dynamic> header,
  //     required Map<String, dynamic> body}) async {
  //   try {
  //     final Response response = await dio.post(
  //       ApiLinks.baseUrl + ApiLinks.addReply + ticketId,
  //       options: Options(headers: header),
  //       data: FormData.fromMap(body),
  //       /*onSendProgress: (count, total) =>
  //           Center(child: CircularProgressIndicator()*/
  //     );
  //     return response;
  //   } on DioException catch (error) {
  //     // print(error);
  //     if (error.response != null) {
  //       // response = error.response!;
  //       return error.response;
  //     }
  //   }
  // }

  Future sendTicket(
      {required Map<String, dynamic> header, required FormData body}) async {
    try {
      final Response response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.getTickets,
        options: Options(
          headers: header,
          // method: 'POST',
        ),
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
