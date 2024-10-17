import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/data/api-request/departments_requests.dart';
import 'package:oraxcrm/data/api-request/priorties_requests.dart';
import 'package:oraxcrm/domain/model/department_model.dart';
import 'package:oraxcrm/domain/model/priorties_model.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenTicketViewmodel extends ChangeNotifier {
  TextEditingController subjectController = TextEditingController();
  TextEditingController ticketDescriptionController = TextEditingController();

  String? department;
  String? priority;

  List<Data>? derpartmentsList;
  List<DataPriorty>? priortiesList;

  bool getPriortiesLastPageFlag = false;
  bool getDepartmentsLastPageFlag = false;

  Future getPriorty(BuildContext context) async {
    PriortiesRequests priortiesRequests = PriortiesRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PriortyModel? priortyModel;
    print(prefs.getString('usrToken'));
    if (getPriortiesLastPageFlag == false) {
      try {
        await priortiesRequests.getPriorties(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            priortyModel = PriortyModel.fromJson(res.data);
            priortiesList!.addAll(priortyModel!.dataPriorty!);
            getPriortiesLastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return priortyModel?.dataPriorty;
      } catch (e) {
        print(e);
      }
    }
  }

  Future getDepartments(BuildContext context) async {
    DepartmentsRequests departmentsRequests = DepartmentsRequests();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DepartmentModel? departmentModel;
    print(prefs.getString('usrToken'));
    if (getDepartmentsLastPageFlag == false) {
      try {
        await departmentsRequests.getDepartments(
          {'Authorization': prefs.getString('usrToken')},
        ).then((res) async {
          if (res.statusCode == 200) {
            departmentModel = DepartmentModel.fromJson(res.data);
            derpartmentsList!.addAll(departmentModel!.data!);
            getPriortiesLastPageFlag = true;
          } else if (res.statusCode == 401) {
            if (context.mounted) {
              context.pushReplacement(Routes.loginRoute);
            }
          }
        });
        return departmentModel?.data;
      } catch (e) {
        print(e);
      }
    }
  }
}
