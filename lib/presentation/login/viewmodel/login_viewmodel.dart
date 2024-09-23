import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/login_requests.dart';
import 'package:oraxcrm/domain/model/client_login_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future login(BuildContext context) async {
    LoginRequest loginRequest = LoginRequest();
    try {
      await loginRequest.login(header: {}, body: {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "rememper": true,
      }).then((res) async {
        if (res.statusCode == 200) {
          LoginModel loginModel = LoginModel.fromJson(res.data);
          if (loginModel.status == false) {
            Fluttertoast.showToast(msg: AppStrings.invalidEmailOrPassword);
          } else if (loginModel.status == true) {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setString('usrToken', loginModel.datalogin!.token!);
            Fluttertoast.showToast(msg: 'asdasd');
            if (context.mounted) {
              context.pushReplacement(Routes.mainScreenRoute);
            }
          }
        } else if (res.statusCode == 400) {
          Fluttertoast.showToast(msg: AppStrings.invalidEmailOrPassword);
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
