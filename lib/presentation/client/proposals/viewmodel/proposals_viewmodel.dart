import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/proposals_requests.dart';
import 'package:oraxcrm/domain/model/proposals_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProposalsViewModel extends ChangeNotifier {
  bool lastPageFlag = false;

  List<ProposalsData>? proposalsList = [];

  Future getProposals(BuildContext context) async {
    ProposalsRequests proposalsRequests = ProposalsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProposalsModel? proposalsModel;
    print(prefs.getString('usrToken'));
    if (lastPageFlag == false) {
      try {
        await proposalsRequests.getProposals(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            proposalsModel = ProposalsModel.fromJson(res.data);
            proposalsList!.addAll(proposalsModel!.data!);
            lastPageFlag = true;
            print(proposalsList);
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return proposalsModel?.data;
      } catch (e) {
        print(e);
      }
    }
  }
}
