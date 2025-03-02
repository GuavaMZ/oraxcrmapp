import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oraxcrm/app/data_holders.dart';
import 'package:oraxcrm/data/api-base/api_urls.dart';
import 'package:path_provider/path_provider.dart';

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

  Future downloadContract(
      Map<String, dynamic> header, String contractId, String hash) async {
    Response response;
    final Directory? downloadsDir = await getDownloadsDirectory();
    try {
      // print("بداية  الريسبونس ");
      response = await dio
          .download(
              'https://democrm.oraxsoft.net/contract/105/e82bf979a2c014ca966a27529404d70b',
              Platform.isAndroid
                  ? '/storage/emulated/0/Download/orax_$contractId'
                  : '${downloadsDir!.path}orax_$contractId',
              options: Options(
                // method: 'GET',
                headers: header,
              ))
          .timeout(Duration(minutes: DataHolders.timeOut));
      if (response.statusCode == 200) {}
      return response;
    } on DioException catch (error) {
      if (error.response != null) {
        // print("خروج من الريسبونس ");
        response = error.response!;
        return response;
      }
    }
  }

  Future getTerms(
      Map<String, dynamic> header, String contractId, String hash) async {
    Response response;
    try {
      // print("بداية  الريسبونس ");
      response = await dio.get(
          '${ApiLinks.baseUrl}${ApiLinks.getContracts}/$contractId/$hash',
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
