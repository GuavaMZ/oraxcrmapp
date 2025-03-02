import 'package:dio/dio.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';

class TicketsRequests {
  Dio dio = Dio();
  Future listAllTickets(
      Map<String, dynamic> header, int page, int limit) async {
    Response response;
    try {
      response = await dio
          .get(
              '${ApiLinks.baseUrl}${ApiLinks.getTickets}?page=$page&limit=$limit',
              options: Options(
                method: 'GET',
                headers: header,
              ))
          .timeout(Duration(minutes: DataHolders.timeOut));
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        response = error.response!;
        return response;
      }
    }
  }

  Future listAllTicketsNoPagination(Map<String, dynamic> header) async {
    Response response;
    try {
      response = await dio
          .get('${ApiLinks.baseUrl}${ApiLinks.getTickets}',
              options: Options(
                method: 'GET',
                headers: header,
              ))
          .timeout(Duration(minutes: DataHolders.timeOut));
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        response = error.response!;
        return response;
      }
    }
  }

  Future getTicketDetails(Map<String, dynamic> header, String id) async {
    Response response;
    try {
      response = await dio
          .get('${ApiLinks.baseUrl}${ApiLinks.getTicketDetailsById}$id',
              options: Options(
                method: 'GET',
                headers: header,
              ))
          .timeout(Duration(minutes: DataHolders.timeOut));
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        response = error.response!;
        return response;
      }
    }
  }

  Future addReply(Map<String, dynamic> header, String id, dynamic body) async {
    Response response;
    try {
      response = await dio
          .request('${ApiLinks.baseUrl}${ApiLinks.addReply}$id',
              data: body,
              options: Options(
                method: 'POST',
                headers: header,
              ))
          .timeout(Duration(minutes: DataHolders.timeOut));
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        response = error.response!;
        return response;
      }
    }
  }

  Future rateEmployee(Map<String, dynamic> header, dynamic body) async {
    Response response;
    try {
      response = await dio
          .request('${ApiLinks.baseUrl}${ApiLinks.rateEmployee}',
              data: body,
              options: Options(
                method: 'POST',
                headers: header,
              ))
          .timeout(Duration(minutes: DataHolders.timeOut));
    } on DioException catch (error) {
      if (error.response != null) {
        response = error.response!;
        return response;
      }
    }
  }
}
