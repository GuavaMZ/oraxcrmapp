import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/contracts_signing_requests.dart';
import 'package:oraxcrm/domain/model/sign_contract_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignContractViewModel extends ChangeNotifier {
  TextEditingController whatsappCodeController = TextEditingController();

  SignContractModel? signContractModel;
  CheckSignContractModel? checkSignContractModel;

  bool isWhatsappCodeVerified = false;

  Future getContractSignCode(String contractID, BuildContext context) async {
    ContractsSigningRequests contractsSigningRequests =
        ContractsSigningRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SignContractModel? signContractModel;
    try {
      await contractsSigningRequests.getSignCode(
          {'Authorization': prefs.getString('usrToken')},
          contractID).then((res) async {
        if (res.statusCode == 200) {
          signContractModel = SignContractModel.fromJson(res.data);
          if (signContractModel?.status == true) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text(AppStrings.codeSentSuccessfully.getString(context))));
          }
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        } else if (res.statusCode == 422) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.data['message']}')));
        }
      });
      return signContractModel;
    } catch (e) {
      print(e);
    }
  }

  Future checkContractSignCode(
      String code, String contractID, BuildContext context) async {
    ContractsSigningRequests contractsSigningRequests =
        ContractsSigningRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CheckSignContractModel? checkSignContractModel;
    try {
      await contractsSigningRequests.checkSignCode(
          {'Authorization': prefs.getString('usrToken')},
          contractID,
          code).then((res) async {
        if (res.statusCode == 200) {
          checkSignContractModel = CheckSignContractModel.fromJson(res.data);
          print(checkSignContractModel?.status);
          if (checkSignContractModel?.status == 1) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${checkSignContractModel?.message}')));
            isWhatsappCodeVerified = true;
          }
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        } else if (res.statusCode == 422) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.data['message']}')));
        }
      });
      return checkSignContractModel;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signTheContract(dynamic body, BuildContext context) async {
    ContractsSigningRequests contractsSigningRequests =
        ContractsSigningRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await contractsSigningRequests.signContract(
          header: {'Authorization': prefs.getString('usrToken')},
          body: body).then((res) async {
        if (res.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 6),
              content: Text(
                  AppStrings.contractSignedSuccessfully.getString(context))));
          context.pushReplacement(Routes.mainScreenRoute);
        } else if (res.statusCode == 401) {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRoute);
          }
        } else if (res.statusCode == 422) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.data['message']}')));
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
