import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/contracts_requests.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContractDetailsViewModel extends ChangeNotifier {
  Future downloadContract(String id, String hash, BuildContext context) async {
    ContractsRequests contractsRequests = ContractsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(prefs.getString('usrToken'));

    try {
      await contractsRequests.downloadContract(
          {'Authorization': prefs.getString('usrToken')},
          id,
          hash).then((res) async {
        if (res.statusCode == 200) {
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
