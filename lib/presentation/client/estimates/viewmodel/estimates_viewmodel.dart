import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/estimates_requests.dart';
import 'package:oraxcrm/domain/model/estimates_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EstimatesViewModel extends ChangeNotifier {
  bool lastPageFlag = false;

  List<EstimatesData>? estimatesList = [];

  Future getEstimates(BuildContext context) async {
    EstimatesRequests estimatesRequests = EstimatesRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    EstimatesModel? estimatesModel;
    print(prefs.getString('usrToken'));
    if (lastPageFlag == false) {
      try {
        await estimatesRequests.getEstimates(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            estimatesModel = EstimatesModel.fromJson(res.data);
            estimatesList!.addAll(estimatesModel!.data!);
            lastPageFlag = true;
            print(estimatesList);
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return estimatesModel?.data;
      } catch (e) {
        print(e);
      }
    }
  }
}
