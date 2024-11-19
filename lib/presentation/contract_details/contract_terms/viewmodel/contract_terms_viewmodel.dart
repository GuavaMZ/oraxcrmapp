import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/contracts_requests.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContractTermsViewModel {
  Future getContractTerms(String id, String hash, BuildContext context) async {
    ContractsRequests contractsRequests = ContractsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(prefs.getString('usrToken'));

    try {
      final res = await contractsRequests.getTerms(
          {'Authorization': prefs.getString('usrToken')},
          id,
          hash).then((res) async {
        if (res.statusCode == 200) {
          return res;
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
      return res.data;
    } catch (e) {
      print(e);
    }
  }
}
