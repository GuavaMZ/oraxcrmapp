import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/contracts_requests.dart';
import 'package:oraxcrm/domain/model/contracts_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContractSigningViewmodel extends ChangeNotifier {
  bool lastPageFlag = false;

  List<DataContract>? contractsList = [];

  Map<String, String> signedStats = {
    '0': AppStrings.unSigned,
    '1': AppStrings.signed,
  };

  Future getContracts(BuildContext context) async {
    ContractsRequests contractsRequests = ContractsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ContractsModel? contractsModel;
    print(prefs.getString('usrToken'));
    if (lastPageFlag == false) {
      try {
        await contractsRequests.getContracts(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            contractsModel = ContractsModel.fromJson(res.data);
            for (DataContract contract in contractsModel!.dataContract) {
              if (contract.signed == '0') {
                contractsList!.add(contract);
              }
            }

            // contractsList!.addAll(contractsModel!.dataContract);
            lastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return contractsModel?.dataContract;
      } catch (e) {
        print(e);
      }
    }
  }
}
